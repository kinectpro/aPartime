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
    func goToTasksModule(feature: Feature, view: FeaturesView)
    func goToCreateEditModule(feature: Feature, view: FeaturesView)
    func goToGetFeaturesErrorPopup(error: String, view: FeaturesView)
}

class FeaturesRouter: NSObject, FeaturesRouterProtocol {
    
    func goToTasksModule(feature: Feature, view: FeaturesView) {
        guard let tasksView = TasksPresenter(feature: feature).view else {
            return
        }
        view.navigationController?.pushViewController(tasksView, animated: true)
    }
    
    func goToCreateEditModule(feature: Feature, view: FeaturesView) {
        let type = ItemType.feature
        let id = feature.id
        let name = feature.name
        let description = feature.description
        let parent = feature.project
        let item = Item(type: type, id: id, name: name, description: description, parent: parent)
        CreateEditPresenter().present(item: item, viewController: view)
    }
    
    func goToGetFeaturesErrorPopup(error: String, view: FeaturesView) {
        AlertManager.shared.showAlert(title: "Get features error", message: error, viewController: view)
    }
    
}
