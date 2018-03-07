//
//  Favorite.swift
//  aPartime
//
//  Created by Bobby numdevios on 02.03.2018.
//  Copyright © 2018 kinectpro. All rights reserved.
//

import Foundation

class Favorite:Task {
    
    func getStringStatus(status:TaskStatus) -> String {
        var stringStatus = ""
        switch status {
        case .paused:
            stringStatus = "Pause"
        case .started:
            stringStatus = "In progress"
        case .finished:
            stringStatus = "Finished"
        }
        return stringStatus
    }
}
