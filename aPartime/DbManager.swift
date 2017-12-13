//
//  DbManager.swift
//  aPartime
//
//  Created by Bobby numdevios on 08.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import Firebase

class DbManager: NSObject {
    
    static let shared = DbManager()
    
    let defaultStore = Firestore.firestore()
}
