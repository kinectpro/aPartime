//
//  Project.swift
//  aPartime
//
//  Created by MyMac on 10/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class Project {
    
    var id: String
    var name: String
    var description: String
    var team: String
    var created: Date
    var modified: Date
    
    init(id: String = "", name: String = "", description: String = "", team: String = "", created: Date = Date(), modified: Date = Date()) {
        self.id = id
        self.name = name
        self.description = description
        self.team = team
        self.created = created
        self.modified = modified
    }
    
}
