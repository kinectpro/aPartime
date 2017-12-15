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
        if let createEditScreenViewController = UIStoryboard(name: "CreateEditScreen", bundle: nil).instantiateViewController(withIdentifier: "CreateEditScreenViewController") as? CreateEditScreenViewController {
            createEditScreenViewController.feature = feature
            viewController.present(createEditScreenViewController, animated: true)
        }
    }
    
    func presentTasksScreen(feature: Feature, viewController: FeaturesScreenViewController) {
        if let tasksViewController = UIStoryboard(name: "TasksScreen", bundle: nil).instantiateViewController(withIdentifier: "TasksScreenViewController") as? TasksScreenViewController {
            tasksViewController.feature = feature
            viewController.present(tasksViewController, animated: true)
        }
    }
    
    func presentGetFeaturesErrorPopup(error: String, viewController: FeaturesScreenViewController) {
        AlertManager.shared.showAlert(title: "Get features error", message: error, viewController: viewController)
    }
    
}
