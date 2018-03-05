//
//  TaskTimer.swift
//  aPartime
//
//  Created by Bobby numdevios on 28.02.2018.
//  Copyright © 2018 kinectpro. All rights reserved.
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

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
}
extension Date {
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}

extension String {
    var dateFromISO8601: Date? {
        return Formatter.iso8601.date(from: self)
    }
}
