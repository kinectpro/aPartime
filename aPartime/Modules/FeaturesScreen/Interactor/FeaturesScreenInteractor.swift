//
//  FeaturesScreenInteractor.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol FeaturesScreenInteractorProtocol {
    func getAllFeatures(forProject: Project)
}

class FeaturesScreenInteractor: FeaturesScreenInteractorProtocol {
    
    var presenter: FeaturesScreenPresenterProtocol!
    
    func getAllFeatures(forProject: Project) {
        DbManager.shared.defaultStore.collection("features").whereField("project", isEqualTo: forProject.name) .getDocuments() { (querySnapshot, error) in
            if let error = error {
                self.presenter.featuresDidGetWithError(error: error.localizedDescription)
                return
            }
            guard let querySnapshot = querySnapshot else {
                self.presenter.featuresDidGetWithError(error: "Get features error")
                return
            }
            var features = [Feature]()
            for document in querySnapshot.documents {
                if let description = document.data()["description"] as? String, let project = document.data()["project"] as? String {
                    let name = document.documentID
                    let feature = Feature(name: name, description: description, project: project)
                    features.append(feature)
                }
            }
            self.presenter.featuresDidGetWithSuccess(features: features)
        }
    }
    
}
