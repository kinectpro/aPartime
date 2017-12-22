//
//  FeaturesRouter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol FeaturesRouterProtocol {
    func goToTasksModule(feature: Feature, viewController: FeaturesViewController)
    func goToCreateEditModule(feature: Feature, viewController: FeaturesViewController)
    func goToGetFeaturesErrorPopup(error: String, viewController: FeaturesViewController)
}

class FeaturesRouter: NSObject, FeaturesRouterProtocol {
    
    func goToTasksModule(feature: Feature, viewController: FeaturesViewController) {
        if let tasksViewController = UIStoryboard(name: "Tasks", bundle: nil).instantiateViewController(withIdentifier: "TasksViewController") as? TasksViewController {
            tasksViewController.feature = feature.name
            viewController.present(tasksViewController, animated: true)
        }
    }
    
    func goToCreateEditModule(feature: Feature, viewController: FeaturesViewController) {
        let type = ItemType.feature
        let id = feature.id
        let name = feature.name
        let description = feature.description
        let parent = feature.project
        let item = Item(type: type, id: id, name: name, description: description, parent: parent)
        CreateEditPresenter().present(item: item, viewController: viewController)
    }
    
    func goToGetFeaturesErrorPopup(error: String, viewController: FeaturesViewController) {
        AlertManager.shared.showAlert(title: "Get features error", message: error, viewController: viewController)
    }
    
}
