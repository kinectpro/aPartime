//
//  TaskViewModel.swift
//  aPartime
//
//  Created by Sergey Kobzin on 14.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class TaskViewModel {
    
    var id: String
    var name: String
    var spentTime: Double
    var description: String
    var status: TaskStatus
    
    init(id: String = "", name: String = "", spentTime: Double = 0.0, description: String = "", status: TaskStatus = .paused) {
        self.id = id
        self.name = name
        self.spentTime = spentTime
        self.description = description
        self.status = status
    }
    
}
