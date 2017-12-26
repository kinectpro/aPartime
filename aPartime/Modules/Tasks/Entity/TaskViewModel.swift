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
    
    init(id: String = "", name: String = "", spentTime: Double = 0.0) {
        self.id = id
        self.name = name
        self.spentTime = spentTime
    }
    
}
