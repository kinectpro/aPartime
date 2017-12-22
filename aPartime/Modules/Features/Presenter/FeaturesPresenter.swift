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
    func present(project: Project, viewController: UIViewController)
    func getAllFeatures()
    func featuresDidGetWithSuccess(features: [Feature])
    func featuresDidGetWithError(error: String)
    func createNewFeature()
    func editFeature(feature: FeatureViewModel)
    func openTasks(forFeature: FeatureViewModel)
}

class FeaturesPresenter: NSObject, FeaturesPresenterProtocol {
    
    var viewController: FeaturesViewController!
    var router: FeaturesRouter!
    var interactor: FeaturesInteractorProtocol!
    
    var features = [Feature]()
    var project = Project()
    
    override init() {
        super.init()
        setupDependencies()
    }
    
    func setupDependencies() {
        guard let viewController = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "FeaturesViewController") as? FeaturesViewController else {
            return
        }
        let interactor = FeaturesInteractor()
        let router = FeaturesRouter()
        viewController.presenter = self
        interactor.presenter = self
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    func present(project: Project, viewController: UIViewController) {
        self.project = project
        viewController.present(self.viewController, animated: true)
    }
    
    func getAllFeatures() {
        interactor.getAllFeatures(forProject: project)
    }
    
    func featuresDidGetWithSuccess(features: [Feature]) {
        self.features = features
        let featureViewModels = features.flatMap({ FeatureViewModel(name: $0.name) })
        viewController.showFeatures(features: featureViewModels)
    }
    
    func featuresDidGetWithError(error: String) {
        router.goToGetFeaturesErrorPopup(error: error, viewController: viewController)
    }
    
    func createNewFeature(){
        router.goToCreateEditModule(feature: Feature(project: project.name), viewController: viewController)
    }
    
    func editFeature(feature: FeatureViewModel){
        if let feature = features.filter({ $0.name == feature.name }).first {
            router.goToCreateEditModule(feature: feature, viewController: viewController)
        }
    }
    
    func openTasks(forFeature feature: FeatureViewModel) {
        if let feature = features.filter({ $0.name == feature.name }).first {
            router.goToTasksModule(feature: feature, viewController: viewController)
        }
    }
    
}
