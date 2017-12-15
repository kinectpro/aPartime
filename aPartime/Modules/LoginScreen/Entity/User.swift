//
//  User.swift
//  aPartime
//
//  Created by Sergey Kobzin on 15.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class User {
    
    var id: String
    var name: String
    var role: String
    
    init(id: String, name: String, role: String = "developer") {
        self.id = id
        self.name = name
        self.role = role
    }
    
}
