//
//  FeaturesPresenter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol FeaturesPresenterProtocol {
    func getAllFeatures()
    func featuresDidGetWithSuccess(features: [Feature])
    func featuresDidGetWithError(error: String)
    func createFeature()
    func editFeature(feature: FeatureViewModel)
    func openTasks(forFeature: FeatureViewModel)
}

class FeaturesPresenter: NSObject, FeaturesPresenterProtocol {
    
    var view: FeaturesView!
    var router: FeaturesRouter!
    var interactor: FeaturesInteractorProtocol!
    
    var features = [Feature]()
    var project = Project()
    
    init(project: Project) {
        super.init()
        setupDependencies()
        self.project = project
    }
    
    func setupDependencies() {
        guard let view = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "FeaturesView") as? FeaturesView else {
            return
        }
        let interactor = FeaturesInteractor()
        let router = FeaturesRouter()
        view.presenter = self
        interactor.presenter = self
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getAllFeatures() {
        interactor.getAllFeatures(forProject: project)
    }
    
    func featuresDidGetWithSuccess(features: [Feature]) {
        self.features = features
        let featureViewModels = features.flatMap({ FeatureViewModel(id: $0.id, name: $0.name) })
        view.showFeatures(features: featureViewModels)
    }
    
    func featuresDidGetWithError(error: String) {
        router.goToGetFeaturesErrorPopup(error: error, view: view)
    }
    
    func createFeature(){
        let feature = Feature(project: project.id)
        router.goToCreateEditModule(feature: feature, view: view)
    }
    
    func editFeature(feature: FeatureViewModel){
        if let feature = features.filter({ $0.id == feature.id }).first {
            router.goToCreateEditModule(feature: feature, view: view)
        }
    }
    
    func openTasks(forFeature feature: FeatureViewModel) {
        if let feature = features.filter({ $0.id == feature.id }).first {
            router.goToTasksModule(feature: feature, view: view)
        }
    }
    
}
