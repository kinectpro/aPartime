//
//  Feature.swift
//  aPartime
//
//  Created by Bobby numdevios on 11.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class Feature {
    
    var id: String
    var name: String
    var description: String
    var tasks: [String]
    var project: String
    
    init(id: String = "", name: String = "", description: String = "", tasks: [String] = [], project: String = "") {
        self.id = id
        self.name = name
        self.description = description
        self.tasks = tasks
        self.project = project
    }
    
}
