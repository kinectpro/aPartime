//
//  LoginScreenConfigurator.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class LoginScreenConfigurator {
    
    static func setupDependencies(viewController: LoginScreenViewController) {
        let presenter = LoginScreenPresenter()
        let router = LoginScreenRouter()
        let interactor = LoginScreenInteractor()
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
}
