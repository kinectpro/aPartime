//
//  ProjectsScreenInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsScreenInteractorProtocol {
    func getAllProjects()
}

class ProjectsScreenInteractor: ProjectsScreenInteractorProtocol {
    
    var presenter: ProjectsScreenPresenterProtocol!
    
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
            var projects = [Project]()
            for document in querySnapshot.documents {
                let project = Project()
                project.name = document.documentID
                project.description = document.data()["description"] as? String
                projects.append(project)
            }
            self.presenter.projectsDidGetWithSuccess(projects: projects)
        }
    }
    
}
