//
//  ProjectsRouter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol ProjectsRouterProtocol {
    func goToFeaturesModule(project: Project, viewController: ProjectsViewController)
    func goToCreateEditModule(project: Project, viewController: ProjectsViewController)
    func goToGetProjectsErrorPopup(error: String, viewController: ProjectsViewController)
}

class ProjectsRouter: NSObject, ProjectsRouterProtocol {
    
    func goToFeaturesModule(project: Project, viewController: ProjectsViewController) {
        if let featuresViewController = UIStoryboard(name: "FeaturesScreen", bundle: nil).instantiateViewController(withIdentifier: "FeaturesViewController") as? FeaturesViewController {
            featuresViewController.project = project
            viewController.present(featuresViewController, animated: true)
        }
    }
    
    func goToCreateEditModule(project: Project, viewController: ProjectsViewController) {
        if let createEditViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
            createEditViewController.id = project.id
            createEditViewController.category = "projects"
            createEditViewController.nameProject = project.name
            createEditViewController.descriptionProject = project.description
            viewController.present(createEditViewController, animated: true)
        }
    }
    
    func goToGetProjectsErrorPopup(error: String, viewController: ProjectsViewController) {
        AlertManager.shared.showAlert(title: "Get projects error", message: error, viewController: viewController)
    }
    
}
