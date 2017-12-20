//
//  LoginScreenConfigurator.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class LoginConfigurator {
    
    static func setupDependencies(viewController: LoginViewController) {
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let interactor = LoginInteractor()
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
}
