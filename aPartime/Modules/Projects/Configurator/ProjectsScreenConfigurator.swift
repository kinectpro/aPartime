//
//  ProjectsConfigurator.swift
//  aPartime
//
//  Created by Sergey Kobzin on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class ProjectsConfigurator {
    
    static func setupDependencies(viewController: ProjectsViewController) {
        let presenter = ProjectsPresenter()
        let router = ProjectsRouter()
        let interactor = ProjectsInteractor()
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
}
