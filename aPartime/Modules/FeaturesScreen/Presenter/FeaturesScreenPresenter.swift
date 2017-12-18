//
//  FeaturesScreenPresenter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol FeaturesScreenPresenterProtocol {
    func getAllFeatures(inProject: Project)
    func createNewFeature()
    func editFeature(feature: FeatureViewModel)
    func openTasksFor(feature: FeatureViewModel)
    func featuresDidGetWithSuccess(features: [Feature])
    func featuresDidGetWithError(error: String)
}

class FeaturesScreenPresenter: NSObject, FeaturesScreenPresenterProtocol {
    
    var viewController: FeaturesScreenViewController!
    var router: FeaturesScreenRouter!
    var interactor: FeaturesScreenInteractorProtocol!
    
    var features = [Feature]()
    var project = Project()
    
    func getAllFeatures(inProject: Project) {
        self.project = inProject
        interactor.getAllFeatures(inProject: project)
    }
    
    func createNewFeature(){
        router.presentCreateEditScreen(feature: Feature(project: project.name), viewController: viewController)
    }
    
    func editFeature(feature: FeatureViewModel){
        if let feature = features.filter({ $0.name == feature.name }).first {
            router.presentCreateEditScreen(feature: feature, viewController: viewController)
        }
    }
    
    func openTasksFor(feature: FeatureViewModel) {
        if let feature = features.filter({ $0.name == feature.name }).first {
            router.presentTasksScreen(feature: feature, viewController: viewController)
        }
    }
    
    func featuresDidGetWithSuccess(features: [Feature]) {
        self.features = features
        let featureViewModels = features.flatMap({ FeatureViewModel(name: $0.name) })
        viewController.showFeatures(features: featureViewModels)
    }
    
    func featuresDidGetWithError(error: String) {
        router.presentGetFeaturesErrorPopup(error: error, viewController: viewController)
    }
    
}
