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
    func presentNewFeatureScreen(featuresScreenViewController: FeaturesScreenViewController, name: String, description: String)
}

class FeaturesScreenRouter {
    func presentNewFeatureScreen(featuresScreenViewController: FeaturesScreenViewController, name: String, description: String) {
        if let createFeatureViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
            
            createFeatureViewController.category = "features"
            createFeatureViewController.nameProject = name
            createFeatureViewController.descriptionProject = description
            featuresScreenViewController.present(createFeatureViewController, animated: true)
        }
    }
}
