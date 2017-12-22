//
//  ProjectsRouter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsRouterProtocol {
    func goToFeaturesModule(project: Project, viewController: ProjectsViewController)
    func goToCreateEditModule(project: Project, viewController: ProjectsViewController)
    func goToGetProjectsErrorPopup(error: String, viewController: ProjectsViewController)
}

class ProjectsRouter: NSObject, ProjectsRouterProtocol {
    
    func goToFeaturesModule(project: Project, viewController: ProjectsViewController) {
        FeaturesPresenter().present(project: project, viewController: viewController)
    }
    
    func goToCreateEditModule(project: Project, viewController: ProjectsViewController) {
        let type = ItemType.project
        let id = project.id
        let name = project.name
        let description = project.description
        let parent = "jUN28Jn18DbaQElxpPuj"
        let item = Item(type: type, id: id, name: name, description: description, parent: parent)
        CreateEditPresenter().present(item: item, viewController: viewController)
    }
    
    func goToGetProjectsErrorPopup(error: String, viewController: ProjectsViewController) {
        AlertManager.shared.showAlert(title: "Get projects error", message: error, viewController: viewController)
    }
    
}
