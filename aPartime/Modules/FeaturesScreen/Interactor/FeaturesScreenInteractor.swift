//
//  FeaturesScreenInteractor.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol FeaturesScreenInteractorProtocol {
    func getAllFeatures() -> [String]
}

class FeaturesScreenInteractor: FeaturesScreenInteractorProtocol {
    
    func getAllFeatures() -> [String] {
        //TODO: call get data method from Firebase
        return ["Profile Screen", "Users Screen", "Movies Screen", "Other Screen"]
    }
    
    
}
