//
//  Item.swift
//  aPartime
//
//  Created by Sergey Kobzin on 18.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

enum ItemType: String {
    case project = "project"
    case feature = "feature"
    case task = "task"
}

class Item {
    
    var type: ItemType
    var name: String
    var description: String
    var parent: String
    
    init(type: ItemType = .project, name: String = "", description: String = "", parent: String = "") {
        self.type = type
        self.name = name
        self.description = description
        self.parent = parent
    }
    
}
