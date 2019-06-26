//
//  ViewController.swift
//  TImer
//
//  Created by Sofia Ongele on 5/30/19.
//  Copyright © 2019 Sofia Ongele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var secondsRemaining = 0
    var timerOn = false
    var pause = false
    @objc func fireTimer() {
        if (secondsRemaining != 0) {
            secondsRemaining -= 1
            var minutes = secondsRemaining / 60 % 60
            timeRemaining.text = "\(String(minutes)):\(String(secondsRemaining % 60))"
        } else {
            timesUp.text = "TIME'S UP"
            timer.invalidate()
            timerOn = false
        }
    }
    @IBAction func startButton(_ sender: Any) {
        if (minutesField.text != "" && pause == false) {
            timerOn = true
            timesUp.text = ""
            secondsRemaining = Int(minutesField.text!)! * 60
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
        if (secondsRemaining != 0 && pause == true) {
            timerOn = true
            timesUp.text = ""
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
    }
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
        timerOn = false
        pause = true
    }
    @IBOutlet weak var timeRemaining: UILabel!
    @IBOutlet weak var minutesField: UITextField!
    @IBOutlet weak var timesUp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

