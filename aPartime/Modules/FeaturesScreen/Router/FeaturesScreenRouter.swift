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
    func presentNewFeatureScreen(featuresScreenViewController: FeaturesScreenViewController, name: String)
}

class FeaturesScreenRouter {
    func presentNewFeatureScreen(featuresScreenViewController: FeaturesScreenViewController, name: String) {
        if let createFeatureViewController = UIStoryboard(name: "CreateEditScreen", bundle: nil).instantiateViewController(withIdentifier: "CreateEditScreenViewController") as? CreateEditScreenViewController {
            createFeatureViewController.nameProject = name
            featuresScreenViewController.present(createFeatureViewController, animated: true)
        }
    }
    
}
