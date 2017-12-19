//
//  ProjectsScreenRouter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol ProjectsScreenRouterProtocol {
    func presentCreateEditScreen(project: Project, viewController: ProjectsScreenViewController)
    func presentFeaturesScreen(project: Project, viewController: ProjectsScreenViewController)
    func presentGetProjectsErrorPopup(error: String, viewController: ProjectsScreenViewController)
}

class ProjectsScreenRouter: NSObject, ProjectsScreenRouterProtocol {
    
    func presentCreateEditScreen(project: Project, viewController: ProjectsScreenViewController) {
        if let createEditScreenViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
            createEditScreenViewController.category = "projects"
            createEditScreenViewController.nameProject = project.name
            createEditScreenViewController.descriptionProject = project.description
            viewController.present(createEditScreenViewController, animated: true)
        }
    }
    
    func presentFeaturesScreen(project: Project, viewController: ProjectsScreenViewController) {
        if let featuresViewController = UIStoryboard(name: "FeaturesScreen", bundle: nil).instantiateViewController(withIdentifier: "FeaturesScreenViewController") as? FeaturesScreenViewController {
            featuresViewController.project = project
            viewController.present(featuresViewController, animated: true)
        }
    }
    
    func presentGetProjectsErrorPopup(error: String, viewController: ProjectsScreenViewController) {
        AlertManager.shared.showAlert(title: "Get projects error", message: error, viewController: viewController)
    }
    
}
