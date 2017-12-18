//
//  CreateEditScreenConfigurator.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class CreateEditScreenConfigurator {
    
    static func setupDependencies(viewController: CreateEditScreenViewController) {
        let interactor = CreateEditScreenInteractor()
        let presenter = CreateEditScreenPresenter()
        let router = CreateEditScreenRouter()
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.router = router
        presenter.interactor = interactor
        
    }
}
