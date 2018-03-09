//
//  FavoritesRouter.swift
//  aPartime
//
//  Created by Bobby numdevios on 07.03.2018.
//  Copyright © 2018 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol FavoritesRouterProtocol {
    func goToTasksModule(feature: String, view: FavoritesView)
}

class FavoritesRouter: NSObject, FavoritesRouterProtocol {
    
    func goToTasksModule(feature: String, view: FavoritesView) {
        guard let tasksView = TasksPresenter(feature: feature).view else {
            return
        }
        
        view.navigationController?.pushViewController(tasksView, animated: true)
    }
    
}
