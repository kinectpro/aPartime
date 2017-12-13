//
//  CreateItemConfigurator.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class CreateItemConfigurator {
    
    static func setupDependencies(createProjectViewController: CreateProjectViewController) {
        let createItemPresenter = CreateItemPresenter()
        let createItemRouter = CreateItemRouter()
        let createItemInteractor = CreateItemInteractor()
        
        createProjectViewController.createItemPresenter = createItemPresenter
        createItemPresenter.createItemController = createProjectViewController
        createItemPresenter.createItemRouter = createItemRouter
        createItemPresenter.createItemInteractor = createItemInteractor
        
    }
}
