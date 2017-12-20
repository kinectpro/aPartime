//
//  FeaturesPresenter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol FeaturesPresenterProtocol {
    func getAllFeatures(inProject: Project)
    func createNewFeature()
    func editFeature(feature: FeatureViewModel)
    func openTasksFor(feature: FeatureViewModel)
    func featuresDidGetWithSuccess(features: [Feature])
    func featuresDidGetWithError(error: String)
}

class FeaturesPresenter: NSObject, FeaturesPresenterProtocol {
    
    var viewController: FeaturesViewController!
    var router: FeaturesRouter!
    var interactor: FeaturesInteractorProtocol!
    
    var features = [Feature]()
    var project = Project()
    
    func getAllFeatures(inProject: Project) {
        self.project = inProject
        interactor.getAllFeatures(inProject: project)
    }
    
    func createNewFeature(){
        router.goToCreateEditModule(feature: Feature(project: project.name), viewController: viewController)
    }
    
    func editFeature(feature: FeatureViewModel){
        if let feature = features.filter({ $0.name == feature.name }).first {
            router.goToCreateEditModule(feature: feature, viewController: viewController)
        }
    }
    
    func openTasksFor(feature: FeatureViewModel) {
        if let feature = features.filter({ $0.name == feature.name }).first {
            router.goToTasksModule(feature: feature, viewController: viewController)
        }
    }
    
    func featuresDidGetWithSuccess(features: [Feature]) {
        self.features = features
        let featureViewModels = features.flatMap({ FeatureViewModel(name: $0.name) })
        viewController.showFeatures(features: featureViewModels)
    }
    
    func featuresDidGetWithError(error: String) {
        router.goToGetFeaturesErrorPopup(error: error, viewController: viewController)
    }
    
}
