//
//  ProjectsRouter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsRouterProtocol {
    func goToFeaturesModule(project: Project, view: ProjectsView)
    func goToCreateEditModule(project: Project, view: ProjectsView)
    func goToGetProjectsErrorPopup(error: String, view: ProjectsView)
}

class ProjectsRouter: NSObject, ProjectsRouterProtocol {
    
    func goToFeaturesModule(project: Project, view: ProjectsView) {
        guard let featuresView = FeaturesPresenter(project: project).view else {
            return
        }
        view.navigationController?.pushViewController(featuresView, animated: true)
    }
    
    func goToCreateEditModule(project: Project, view: ProjectsView) {
        let type = ItemType.project
        let id = project.id
        let name = project.name
        let description = project.description
        let parent = "jUN28Jn18DbaQElxpPuj"
        let item = Item(type: type, id: id, name: name, description: description, parent: parent)
        CreateEditPresenter().present(item: item, viewController: view)
    }
    
    func goToGetProjectsErrorPopup(error: String, view: ProjectsView) {
        AlertManager.shared.showAlert(title: "Get projects error", message: error, viewController: view)
    }
    
}
