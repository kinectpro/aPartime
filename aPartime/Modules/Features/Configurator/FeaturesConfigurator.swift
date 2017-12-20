//
//  FeaturesConfigurator.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class FeaturesConfigurator {
    
    static func setupDependencies(viewController: FeaturesViewController) {
        let interactor = FeaturesInteractor()
        let presenter = FeaturesPresenter()
        let router = FeaturesRouter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
