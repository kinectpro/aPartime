//
//  FeaturesScreenInteractor.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol FeaturesInteractorProtocol {
    func getAllFeatures(forProject: Project)
}

class FeaturesInteractor: NSObject, FeaturesInteractorProtocol {
    
    var presenter: FeaturesPresenterProtocol!
    
    func getAllFeatures(forProject project: Project) {
        DbManager.shared.defaultStore.collection("features").whereField("project", isEqualTo: project.name).getDocuments() { (querySnapshot, error) in
            if let error = error {
                self.presenter.featuresDidGetWithError(error: error.localizedDescription)
                return
            }
            guard let querySnapshot = querySnapshot else {
                self.presenter.featuresDidGetWithError(error: "Get features error")
                return
            }
            let features = querySnapshot.documents.map({ (document) -> Feature in
                let id = document.documentID
                let name = document.data()["name"] as? String ?? ""
                let description = document.data()["description"] as? String ?? ""
                let project = document.data()["project"] as? String ?? ""
                let created = document.data()["created"] as? Date ?? Date()
                let modified = document.data()["modified"] as? Date ?? Date()
                let feature = Feature(id: id, name: name, description: description, project: project, created: created, modified: modified)
                return feature
            }).sorted(by: { $0.modified > $1.modified })
            self.presenter.featuresDidGetWithSuccess(features: features)
        }
    }
    
}
