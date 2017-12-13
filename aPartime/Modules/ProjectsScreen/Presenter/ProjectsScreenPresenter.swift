//
//  ProjectsScreenPresenter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsScreenPresenterProtocol {
    func getAllProjects()
    func createNewProject()
    func editProject(name: String)
    func openFeaturesFor(project: String)
    func projectsDidGetWithSuccess(projects: [Project])
    func projectsDidGetWithError(error: String)
}

class ProjectsScreenPresenter: NSObject, ProjectsScreenPresenterProtocol {
    
    var viewController: ProjectsScreenViewController!
    var router: ProjectsScreenRouter!
    var interactor: ProjectsScreenInteractor!
    
    var projects = [Project]()
    
    func getAllProjects() {
        interactor.getAllProjects()
    }
    
    func createNewProject(){
        router.presentNewProjectsScreen(viewController: viewController, name: "")
    }
    
    func editProject(name: String){
        router.presentNewProjectsScreen(viewController: viewController, name: name)
    }
    
    func openFeaturesFor(project: String) {
        router.presentFeaturesScreen(viewController: viewController, project: project)
    }
    
    func projectsDidGetWithSuccess(projects: [Project]) {
        let projectsNames = projects.flatMap({ $0.name })
        viewController.showProjects(projects: projectsNames)
    }
    
    func projectsDidGetWithError(error: String) {
        
    }
}
