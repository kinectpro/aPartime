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

class ProjectsScreenInteractor: NSObject, ProjectsScreenInteractorProtocol {
    
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
                if let description = document.data()["description"] as? String {
                    let name = document.documentID
                    let project = Project(name: name, description: description)
                    projects.append(project)
                }
            }
            self.presenter.projectsDidGetWithSuccess(projects: projects)
        }
    }
    
}
