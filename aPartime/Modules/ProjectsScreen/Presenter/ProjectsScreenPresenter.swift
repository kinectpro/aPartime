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
    func editProject(project: ProjectViewModel)
    func openFeaturesFor(project: ProjectViewModel)
    func projectsDidGetWithSuccess(projects: [Project])
    func projectsDidGetWithError(error: String)
}

class ProjectsScreenPresenter: NSObject, ProjectsScreenPresenterProtocol {
    
    var viewController: ProjectsScreenViewController!
    var router: ProjectsScreenRouterProtocol!
    var interactor: ProjectsScreenInteractorProtocol!
    
    var projects = [Project]()
    
    func getAllProjects() {
        interactor.getAllProjects()
    }
    
    func createNewProject(){
        router.presentCreateEditScreen(project: Project(), viewController: viewController)
    }
    
    func editProject(project: ProjectViewModel){
        if let project = projects.filter({ $0.name == project.name }).first {
            router.presentCreateEditScreen(project: project, viewController: viewController)
        }
    }
    
    func openFeaturesFor(project: ProjectViewModel) {
        if let project = projects.filter({ $0.name == project.name }).first {
            router.presentFeaturesScreen(project: project, viewController: viewController)
        }
    }
    
    func projectsDidGetWithSuccess(projects: [Project]) {
        self.projects = projects
        let projectViewModels = projects.flatMap({ ProjectViewModel(name: $0.name) })
        viewController.showProjects(projects: projectViewModels)
    }
    
    func projectsDidGetWithError(error: String) {
        router.presentGetProjectsErrorPopup(error: error, viewController: viewController)
    }
    
}
