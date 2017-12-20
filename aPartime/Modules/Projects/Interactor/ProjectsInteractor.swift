//
//  ProjectsInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsInteractorProtocol {
    func getAllProjects()
}

class ProjectsInteractor: NSObject, ProjectsInteractorProtocol {
    
    var presenter: ProjectsPresenterProtocol!
    
    func getAllProjects() {
        DbManager.shared.defaultStore.collection("projects").getDocuments() { (querySnapshot, error) in
            if let error = error {
                self.presenter.projectsDidGetWithError(error: error.localizedDescription)
                return
            }
            guard let querySnapshot = querySnapshot else {
                self.presenter.projectsDidGetWithError(error: "Get projects error")
                return
            }
            let projects = querySnapshot.documents.map({ (document) -> Project in
                let id = document.documentID
                let name = document.data()["name"] as? String ?? ""
                let description = document.data()["description"] as? String ?? ""
                let features = document.data()["features"] as? [String] ?? [String]()
                let users = document.data()["users"] as? [String] ?? [String]()
                return Project(id: id, name: name, description: description, features: features, users: users)
            })
            self.presenter.projectsDidGetWithSuccess(projects: projects)
        }
    }
    
}
