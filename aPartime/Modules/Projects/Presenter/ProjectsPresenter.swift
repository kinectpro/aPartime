//
//  ProjectsPresenter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol ProjectsPresenterProtocol {
    func getAllProjects()
    func projectsDidGetWithSuccess(projects: [Project])
    func projectsDidGetWithError(error: String)
    func createProject()
    func editProject(project: ProjectViewModel)
    func openFeatures(forProject: ProjectViewModel)
}

class ProjectsPresenter: NSObject, ProjectsPresenterProtocol {
    
    var view: ProjectsView!
    var router: ProjectsRouterProtocol!
    var interactor: ProjectsInteractorProtocol!
    
    var projects = [Project]()
    
    override init() {
        super.init()
        setupDependencies()
    }
    
    func setupDependencies() {
        guard let view = UIStoryboard(name: "Projects", bundle: nil).instantiateViewController(withIdentifier: "ProjectsView") as? ProjectsView else {
            return
        }
        let interactor = ProjectsInteractor()
        let router = ProjectsRouter()
        view.presenter = self
        interactor.presenter = self
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getAllProjects() {
        interactor.getAllProjects()
    }
    
    func projectsDidGetWithSuccess(projects: [Project]) {
        self.projects = projects
        let projectViewModels = projects.flatMap({ ProjectViewModel(id: $0.id, name: $0.name) })
        view.showProjects(projects: projectViewModels)
    }
    
    func projectsDidGetWithError(error: String) {
        router.goToGetProjectsErrorPopup(error: error, view: view)
    }
    
    func createProject(){
        let project = Project()
        router.goToCreateEditModule(project: project, view: view)
    }
    
    func editProject(project: ProjectViewModel) {
        if let project = projects.filter({ $0.id == project.id }).first {
            router.goToCreateEditModule(project: project, view: view)
        }
    }
    
    func openFeatures(forProject project: ProjectViewModel) {
        if let project = projects.filter({ $0.id == project.id }).first {
            router.goToFeaturesModule(project: project, view: view)
        }
    }
    
}
