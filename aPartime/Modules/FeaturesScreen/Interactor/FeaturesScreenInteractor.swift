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
    func getAllFeatures(projectName: String, success:@escaping (_ features:[Feature]) -> Void, fail:@escaping() -> Void)
}

class FeaturesScreenInteractor: FeaturesScreenInteractorProtocol {
    
    func getAllFeatures() -> [String] {
        //TODO: delete this method
        return ["Profile Screen", "Users Screen", "Movies Screen", "Other Screen"]
    }
    
    func getAllFeatures(projectName: String, success:@escaping (_ features:[Feature]) -> Void, fail:@escaping() -> Void){
        DbManager.shared.defaultStore.collection("features").whereField("project", isEqualTo: projectName).getDocuments() { (querySnapshot, err) in
            
            var featuresList = [Feature]()
            
            if let err = err {
                print("Error getting list of Features: \(err)")
                fail()
            } else {
                for document in querySnapshot!.documents {
                    //print("\(document.documentID) => \(document.data())")
                    let feature = Feature()
                    feature.name = document.documentID
                    feature.descriptionFeature = document.data()["description"] as? String
                    feature.projectName = projectName
                    featuresList.append(feature)
                }
                success(featuresList)
            }
        }
    }
    
    
}
