//
//  Task.swift
//  aPartime
//
//  Created by Bobby numdevios on 11.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class Task {
    
    var name: String
    var description: String
    var feature: String
    var startTime: Date
    var stopTime: Date
    var spentTime: Double
    var isPause: Bool
    
    init(name: String = "", description: String = "", feature: String = "", startTime: Date = Date(), stopTime: Date = Date(), spentTime: Double = 0.0, isPause: Bool = true) {
        self.name = name
        self.description = description
        self.feature = feature
        self.startTime = startTime
        self.stopTime = stopTime
        self.spentTime = spentTime
        self.isPause = isPause
    }
    
}
