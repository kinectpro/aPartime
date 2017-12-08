//
//  FeaturesScreenPresenter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol FeaturesScreenPresenterProtocol {
    func getAllFeatures() -> [String]
    func createNewFeature()
    func editFeature(name: String)
}

class FeaturesScreenPresenter: FeaturesScreenPresenterProtocol {
    
    var featuresScreenViewController: FeaturesScreenViewController!
    var featuresScreenRouter: FeaturesScreenRouter!
    var featuresScreenInteractor: FeaturesScreenInteractorProtocol!
    
    func getAllFeatures() -> [String]{
        return featuresScreenInteractor.getAllFeatures()
    }
    
    func createNewFeature(){
        featuresScreenRouter.presentNewFeatureScreen(featuresScreenViewController: featuresScreenViewController, name:"")
    }
    func editFeature(name: String){
        
        featuresScreenRouter.presentNewFeatureScreen(featuresScreenViewController: featuresScreenViewController, name: name)
    }
}
