//
//  ViewController.swift
//  Countdown
//
//  Created by Artsiom Sadyryn on 12/23/17.
//  Copyright © 2017 Artsiom Sadyryn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(printTime), userInfo: nil, repeats: true)
        timer.fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let formatter = DateFormatter()
    
    let userCalendar = Calendar.current
    
    let requestComponents = Set<Calendar.Component>([.day, .hour, .minute, .second])
   
    @objc func printTime() {
        formatter.dateFormat = "MM/dd/yy hh:mm:ss"
        let startTime = Date()
        let endTime = formatter.date(from: "01/01/18 00:00:00")
        if let endTime = endTime {
            let timeDifference = userCalendar.dateComponents(requestComponents, from: startTime, to: endTime)
            if let days = timeDifference.day, let hours = timeDifference.hour, let minutes = timeDifference.minute, let seconds = timeDifference.second {
                var daysFormatted = String()
                var hoursFormated = String()
                var minutesFormated = String()
                var secondsFormated = String()

                if days < 10 {
                    daysFormatted = "0" + String(days)
                }
                else {
                    daysFormatted = String(days)
                }

                if hours < 10 {
                    hoursFormated = "0" + String(hours)
                }
                else {
                    hoursFormated = String(hours)
                }

                if minutes < 10 {
                    minutesFormated = "0" + String(minutes)
                }
                else {
                    minutesFormated = String(minutes)
                }

                if seconds < 10 {
                    secondsFormated = "0" + String(seconds)
                }
                else {
                    secondsFormated = String(seconds)
                }

                timeLabel.text = daysFormatted + ":" + hoursFormated + ":" + minutesFormated + ":" + secondsFormated
            }
        }
    }
}

