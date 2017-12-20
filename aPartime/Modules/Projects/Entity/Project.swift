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
    var features: [String]
    var users: [String]
    
    init(id: String = "", name: String = "", description: String = "", features: [String] = [], users: [String] = []) {
        self.id = id
        self.name = name
        self.description = description
        self.features = features
        self.users = users
    }
    
}
