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
    func presentNewProjectsScreen(viewController: ProjectsScreenViewController, name: String)
    func presentFeaturesScreen(viewController: ProjectsScreenViewController, project: String)
    func presentGetProjectsErrorPopup(error: String, viewController: ProjectsScreenViewController)
}

class ProjectsScreenRouter {
    func presentNewProjectsScreen(viewController: ProjectsScreenViewController, name: String) {
        if let createProjectViewController = UIStoryboard(name: "CreateEditScreen", bundle: nil).instantiateViewController(withIdentifier: "CreateEditScreenViewController") as? CreateEditScreenViewController {
            createProjectViewController.nameProject = name
            viewController.present(createProjectViewController, animated: true)
        }
    }
    
    func presentFeaturesScreen(viewController: ProjectsScreenViewController, project: String) {
        if let featuresViewController = UIStoryboard(name: "FeaturesScreen", bundle: nil).instantiateViewController(withIdentifier: "FeaturesScreenViewController") as? FeaturesScreenViewController {
            featuresViewController.project = project
            viewController.present(featuresViewController, animated: true)
        }
    }
    
    func presentGetProjectsErrorPopup(error: String, viewController: ProjectsScreenViewController) {
        AlertManager.shared.showAlert(title: "Get projects error", message: error, viewController: viewController)
    }
    
}
