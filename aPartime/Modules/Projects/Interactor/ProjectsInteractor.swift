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
                let team = document.data()["team"] as? String ?? ""
                let created = document.data()["created"] as? Date ?? Date()
                let modified = document.data()["modified"] as? Date ?? Date()
                let project = Project(id: id, name: name, description: description, team: team, created: created, modified: modified)
                return project
            }).sorted(by: { $0.modified > $1.modified })
            self.presenter.projectsDidGetWithSuccess(projects: projects)
        }
    }
    
}
