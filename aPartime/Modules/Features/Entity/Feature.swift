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
    var project: String
    var created: Date
    var modified: Date
    
    init(id: String = "", name: String = "", description: String = "", project: String = "", created: Date = Date(), modified: Date = Date()) {
        self.id = id
        self.name = name
        self.description = description
        self.project = project
        self.created = created
        self.modified = modified
    }
    
}
