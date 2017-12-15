//
//  TasksScreenRouter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol TasksScreenRouterProtocol {
    func presentCreateEditScreen(task: Task, viewController: TasksScreenViewController)
    func presentGetTasksErrorPopup(error: String, viewController: TasksScreenViewController)
}

class TasksScreenRouter: NSObject, TasksScreenRouterProtocol {
    
    func presentCreateEditScreen(task: Task, viewController: TasksScreenViewController) {
        if let createEditScreenViewController = UIStoryboard(name: "CreateEditScreen", bundle: nil).instantiateViewController(withIdentifier: "CreateEditScreenViewController") as? CreateEditScreenViewController {
            createEditScreenViewController.task = task
            viewController.present(createEditScreenViewController, animated: true)
        }
    }
    
//    func presentEditFeatureScreen(featuresScreenViewController: FeaturesScreenViewController, name: String, description: String) {
//        if let createFeatureViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
//
//            createFeatureViewController.category = "features"
//            createFeatureViewController.nameProject = name
//            createFeatureViewController.descriptionProject = description
//            featuresScreenViewController.present(createFeatureViewController, animated: true)
//        }
//    }
    
    
    func presentGetTasksErrorPopup(error: String, viewController: TasksScreenViewController) {
        AlertManager.shared.showAlert(title: "Get tasks error", message: error, viewController: viewController)
    }
    
}
