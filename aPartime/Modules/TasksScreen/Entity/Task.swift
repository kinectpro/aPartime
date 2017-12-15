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
    
    init(name: String = "", description: String = "", feature: String = "") {
        self.name = name
        self.description = description
        self.feature = feature
    }
    
}
