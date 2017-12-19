//
//  FeaturesScreenRouter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol FeaturesScreenRouterProtocol {
    func presentCreateEditScreen(feature: Feature, viewController: FeaturesScreenViewController)
    func presentTasksScreen(feature: Feature, viewController: FeaturesScreenViewController)
    func presentGetFeaturesErrorPopup(error: String, viewController: FeaturesScreenViewController)
}

class FeaturesScreenRouter: NSObject, FeaturesScreenRouterProtocol {
    
    func presentCreateEditScreen(feature: Feature, viewController: FeaturesScreenViewController) {
        if let createEditScreenViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
            createEditScreenViewController.category = "features"
            createEditScreenViewController.nameProject = feature.name
            createEditScreenViewController.descriptionProject = feature.description
            createEditScreenViewController.categoryName = feature.project
            viewController.present(createEditScreenViewController, animated: true)
        }
    }
    
    func presentTasksScreen(feature: Feature, viewController: FeaturesScreenViewController) {
        if let tasksViewController = UIStoryboard(name: "Tasks", bundle: nil).instantiateViewController(withIdentifier: "TasksViewController") as? TasksViewController {
            tasksViewController.feature = feature.name
            viewController.present(tasksViewController, animated: true)
        }
    }
    
    func presentGetFeaturesErrorPopup(error: String, viewController: FeaturesScreenViewController) {
        AlertManager.shared.showAlert(title: "Get features error", message: error, viewController: viewController)
    }
    
}
