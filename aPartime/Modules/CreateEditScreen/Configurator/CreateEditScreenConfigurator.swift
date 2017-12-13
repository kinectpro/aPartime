//
//  CreateEditScreenConfigurator.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class CreateEditScreenConfigurator {
    
    static func setupDependencies(createProjectViewController: CreateEditScreenViewController) {
        let createItemPresenter = CreateEditScreenPresenter()
        let createItemRouter = CreateEditScreenRouter()
        let createItemInteractor = CreateEditScreenInteractor()
        
        createProjectViewController.createItemPresenter = createItemPresenter
        createItemPresenter.createItemController = createProjectViewController
        createItemPresenter.createItemRouter = createItemRouter
        createItemPresenter.createItemInteractor = createItemInteractor
        
    }
}
