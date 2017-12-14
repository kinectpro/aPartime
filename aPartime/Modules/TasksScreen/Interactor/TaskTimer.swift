//
//  TaskTimer.swift
//  aPartime
//
//  Created by Bobby numdevios on 14.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class TaskTimer {
    var timerTask : Timer?
    var timerHandler: ()->Void = {}
    
    func startTimer () {
        
        if timerTask == nil {
            timerTask = Timer.scheduledTimer(
                timeInterval: TimeInterval(1.0),
                target      : self,
                selector    : #selector(timerAction),
                userInfo    : nil,
                repeats     : true)
        }
    }
    
    @objc func timerAction(){
        timerHandler()
    }
    
    func pauseTimer() {
        if timerTask != nil {
            timerTask?.invalidate()
            timerTask = nil
        }
    }
}
