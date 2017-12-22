//
//  ItemViewModel.swift
//  aPartime
//
//  Created by Sergey Kobzin on 21.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class ItemViewModel {
    
    var type: ItemType
    var id: String
    var name: String
    var description: String
    
    init(type: ItemType = .project, id: String = "", name: String = "", description: String = "") {
        self.type = type
        self.id = id
        self.name = name
        self.description = description
    }
    
}
