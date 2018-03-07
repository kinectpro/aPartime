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
        view.navigationController?.viewControllers.first?.present(tasksView, animated: true, completion: nil)
        //view.navigationController?.pushViewController(tasksView, animated: true)
        //view.present(tasksView, animated: true, completion: nil)
        //NavigationPresenter().view.pushViewController(tasksView, animated: true)
    }
    
}
