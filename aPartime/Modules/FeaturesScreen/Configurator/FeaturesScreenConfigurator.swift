//
//  FeaturesScreenConfigurator.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class FeaturesScreenConfigurator {
    
    static func setupDependencies(viewController: FeaturesScreenViewController) {
        let interactor = FeaturesScreenInteractor()
        let presenter = FeaturesScreenPresenter()
        let router = FeaturesScreenRouter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
