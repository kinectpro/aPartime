//
//  ProjectsScreenConfigurator.swift
//  aPartime
//
//  Created by Sergey Kobzin on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class ProjectsScreenConfigurator {
    
    static func setupDependencies(viewController: ProjectsScreenViewController) {
        let presenter = ProjectsScreenPresenter()
        let router = ProjectsScreenRouter()
        let interactor = ProjectsScreenInteractor()
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
}
