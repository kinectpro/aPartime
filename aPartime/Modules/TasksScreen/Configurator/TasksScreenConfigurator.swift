//
//  TasksScreenConfigurator.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class TasksScreenConfigurator {
    
    static func setupDependencies(viewController: TasksScreenViewController) {
        let interactor = TasksScreenInteractor()
        let presenter = TasksScreenPresenter()
        let router = TasksScreenRouter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
