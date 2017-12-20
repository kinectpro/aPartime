//
//  ProjectsPresenter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsPresenterProtocol {
    func getAllProjects()
    func createNewProject()
    func editProject(project: ProjectViewModel)
    func openFeaturesFor(project: ProjectViewModel)
    func projectsDidGetWithSuccess(projects: [Project])
    func projectsDidGetWithError(error: String)
}

class ProjectsPresenter: NSObject, ProjectsPresenterProtocol {
    
    var viewController: ProjectsViewController!
    var router: ProjectsRouterProtocol!
    var interactor: ProjectsInteractorProtocol!
    
    var projects = [Project]()
    
    func getAllProjects() {
        interactor.getAllProjects()
    }
    
    func projectsDidGetWithSuccess(projects: [Project]) {
        self.projects = projects
        let projectViewModels = projects.flatMap({ ProjectViewModel(id: $0.id, name: $0.name) })
        viewController.showProjects(projects: projectViewModels)
    }
    
    func projectsDidGetWithError(error: String) {
        router.goToGetProjectsErrorPopup(error: error, viewController: viewController)
    }
    
    func createNewProject(){
        router.goToCreateEditModule(project: Project(), viewController: viewController)
    }
    
    func editProject(project: ProjectViewModel){
        if let project = projects.filter({ $0.id == project.id }).first {
            router.goToCreateEditModule(project: project, viewController: viewController)
        }
    }
    
    func openFeaturesFor(project: ProjectViewModel) {
        if let project = projects.filter({ $0.id == project.id }).first {
            router.goToFeaturesModule(project: project, viewController: viewController)
        }
    }
    
}
