//
//  Feature.swift
//  aPartime
//
//  Created by Bobby numdevios on 11.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class Feature {
    
    var name: String
    var description: String
    var project: String
    
    init(name: String = "", description: String = "", project: String = "") {
        self.name = name
        self.description = description
        self.project = project
    }
    
}
