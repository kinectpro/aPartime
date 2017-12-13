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
    func presentNewFeatureScreen(featuresScreenViewController: FeaturesScreenViewController)
    func presentEditFeatureScreen(featuresScreenViewController: FeaturesScreenViewController, name: String, description: String)
    func presentTasksScreen(featuresScreenViewController: FeaturesScreenViewController, feature: String)
}

class FeaturesScreenRouter {
    
    func presentTasksScreen(featuresScreenViewController: FeaturesScreenViewController, feature: String) {
        if let tasksViewController = UIStoryboard(name: "Tasks", bundle: nil).instantiateViewController(withIdentifier: "TasksViewController") as? TasksViewController{
            
            tasksViewController.feature = feature
            featuresScreenViewController.present(tasksViewController, animated: true)
        }
    }
    
    func presentEditFeatureScreen(featuresScreenViewController: FeaturesScreenViewController, name: String, description: String) {
        if let createFeatureViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
            
            createFeatureViewController.category = "features"
            createFeatureViewController.nameProject = name
            createFeatureViewController.descriptionProject = description
            featuresScreenViewController.present(createFeatureViewController, animated: true)
        }
    }
    
    func presentNewFeatureScreen(featuresScreenViewController: FeaturesScreenViewController) {
        if let createFeatureViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
            
            createFeatureViewController.category = "features"
            createFeatureViewController.categoryName = featuresScreenViewController.project
            featuresScreenViewController.present(createFeatureViewController, animated: true)
        }
    }
}
