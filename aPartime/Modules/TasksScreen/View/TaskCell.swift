//
//  TaskCell.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startPauseButton: UIButton!
    
    var startTappedHandler: ()->Void = {}
    var stopTappedHandler: ()->Void = {}
    var isPause = false
    //var timerTask:Timer?
    var startDate:Date!
    var stopDate: Date!
    var spentTime: Double = 0.0
    var taskTimer: TaskTimer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func startPauseTapped(_ sender: UIButton) {
       isPause = !isPause
       didPause()
       startTappedHandler()
    }
    
    @IBAction func stopTapped(_ sender: UIButton) {
        stopTappedHandler()
    }
    
    func didPause(){
        
        let imageButton:UIImage = isPause ? #imageLiteral(resourceName: "PlayIcon") : #imageLiteral(resourceName: "PauseIcon")
        
        //isPause ? startTimer() : pauseTimer()
        
        startPauseButton.setImage(imageButton, for: .normal)
        
    }
    
    func trackingTime() {
        if startDate == nil {
            startDate = Date()
        }
        spentTime += 1
        timeLabel.text = stringFromTimeInterval(interval: spentTime) as String
    }
//    func startTimer () {
//
//        if startDate == nil {
//            startDate = Date()
//        }
//
//        if timerTask == nil {
//            timerTask = Timer.scheduledTimer(
//                timeInterval: TimeInterval(1.0),
//                target      : self,
//                selector    : #selector(timerAction),
//                userInfo    : nil,
//                repeats     : true)
//        }
//    }
//
//    @objc func timerAction(){
//        spentTime += 1.0
//        timeLabel.text = stringFromTimeInterval(interval: spentTime) as String
//    }
//
//    func pauseTimer() {
//        if timerTask != nil {
//            timerTask?.invalidate()
//            timerTask = nil
//            //startDate = nil
//        }
//    }
//
    func stringFromTimeInterval(interval: Double) -> NSString {

        let hours = (Int(interval) / 3600)
        let minutes = Int(interval / 60) - Int(hours * 60)
        let seconds = Int(interval) - (Int(interval / 60) * 60)

        return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }

}
