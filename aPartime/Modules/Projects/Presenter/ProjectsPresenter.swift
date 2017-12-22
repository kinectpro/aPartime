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
    func present(viewController: UIViewController)
    func getAllProjects()
    func projectsDidGetWithSuccess(projects: [Project])
    func projectsDidGetWithError(error: String)
    func createNewProject()
    func editProject(project: ProjectViewModel)
    func openFeatures(forProject: ProjectViewModel)
}

class ProjectsPresenter: NSObject, ProjectsPresenterProtocol {
    
    var viewController: ProjectsViewController!
    var router: ProjectsRouterProtocol!
    var interactor: ProjectsInteractorProtocol!
    
    var projects = [Project]()
    
    override init() {
        super.init()
        setupDependencies()
    }
    
    func setupDependencies() {
        guard let viewController = UIStoryboard(name: "Projects", bundle: nil).instantiateViewController(withIdentifier: "ProjectsViewController") as? ProjectsViewController else {
            return
        }
        let interactor = ProjectsInteractor()
        let router = ProjectsRouter()
        viewController.presenter = self
        interactor.presenter = self
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    func present(viewController: UIViewController) {
        viewController.present(self.viewController, animated: true)
    }
    
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
    
    func editProject(project: ProjectViewModel) {
        if let project = projects.filter({ $0.id == project.id }).first {
            router.goToCreateEditModule(project: project, viewController: viewController)
        }
    }
    
    func openFeatures(forProject project: ProjectViewModel) {
        if let project = projects.filter({ $0.id == project.id }).first {
            router.goToFeaturesModule(project: project, viewController: viewController)
        }
    }
    
}
