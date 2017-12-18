//
//  User.swift
//  aPartime
//
//  Created by Sergey Kobzin on 15.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

enum UserRole {
    case developer
    case manager
}

class User {
    
    var id: String
    var name: String
    var role: UserRole
    
    init(id: String = "", name: String = "", role: UserRole = .developer) {
        self.id = id
        self.name = name
        self.role = role
    }
    
}
