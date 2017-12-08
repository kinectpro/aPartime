//
//  FeaturesScreenConfigurator.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class FeaturesScreenConfigurator {
    
    static func setupDependencies(featuresScreenViewController: FeaturesScreenViewController) {
        let featuresScreenPresenter = FeaturesScreenPresenter()
        let featuresScreenRouter = FeaturesScreenRouter()
        let featuresScreenInteractor = FeaturesScreenInteractor()
        
        featuresScreenViewController.featuresScreenPresenter = featuresScreenPresenter
        featuresScreenPresenter.featuresScreenViewController = featuresScreenViewController
        featuresScreenPresenter.featuresScreenRouter = featuresScreenRouter
        featuresScreenPresenter.featuresScreenInteractor = featuresScreenInteractor
        
    }
    
}
