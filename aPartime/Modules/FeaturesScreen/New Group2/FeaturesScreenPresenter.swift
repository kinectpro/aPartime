//
//  FeaturesScreenPresenter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol FeaturesScreenPresenterProtocol {
    //func getAllFeatures() -> [String]
    func getAllFeatures(projectName: String, success:@escaping (_ features:[Feature]) -> Void, fail:@escaping() -> Void)
    func createNewFeature()
    func editFeature(name: String, description: String)
}

class FeaturesScreenPresenter: FeaturesScreenPresenterProtocol {
    
    var featuresScreenViewController: FeaturesScreenViewController!
    var featuresScreenRouter: FeaturesScreenRouter!
    var featuresScreenInteractor: FeaturesScreenInteractorProtocol!
    
//    func getAllFeatures() -> [String]{
//        return featuresScreenInteractor.getAllFeatures()
//    }
    
    func getAllFeatures(projectName: String, success:@escaping (_ features:[Feature]) -> Void, fail:@escaping() -> Void){
        featuresScreenInteractor.getAllFeatures(projectName: projectName, success: { (featuresList) in
            success(featuresList)
        }){
            fail()
        }
    }
    
    func createNewFeature(){
        featuresScreenRouter.presentNewFeatureScreen(featuresScreenViewController: featuresScreenViewController)
    }
    func editFeature(name: String, description: String){
        
        featuresScreenRouter.presentEditFeatureScreen(featuresScreenViewController: featuresScreenViewController, name: name, description: description)
    }
}
