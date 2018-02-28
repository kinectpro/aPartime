//
//  Task.swift
//  aPartime
//
//  Created by Bobby numdevios on 11.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

enum TaskStatus: Int {
//    case created = 0
//    case started = 1
//    case paused = 2
//    case unpaused = 3
//    case finished = 4
    case paused = 0
    case started = 1
    case finished = 3
}

class Task {
    
    var id: String
    var name: String
    var description: String
    var feature: String
    var spentTime: Double
    var status: TaskStatus
    var created: Date
    var modified: Date
    var started: Date
    var paused: Date
    var unpaused: Date
    var finished: Date
    
    init(id: String = "", name: String = "", description: String = "", feature: String = "", spentTime: Double = 0.0, status: TaskStatus = .paused, created: Date = Date(), modified: Date = Date(), started: Date = Date(), paused: Date = Date(), unpaused: Date = Date(), finished: Date = Date()) {
        self.id = id
        self.name = name
        self.description = description
        self.feature = feature
        self.spentTime = spentTime
        self.status = status
        self.created = created
        self.modified = modified
        self.started = started
        self.paused = paused
        self.unpaused = unpaused
        self.finished = finished
    }
    
}
