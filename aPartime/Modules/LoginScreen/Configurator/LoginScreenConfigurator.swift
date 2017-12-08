//
//  LoginScreenConfigurator.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class LoginScreenConfigurator {
    
    static func setupDependencies(loginScreenViewController: LoginScreenViewController) {
        let loginScreenPresenter = LoginScreenPresenter()
        let loginScreenRouter = LoginScreenRouter()
        let loginScreenInteractor = LoginScreenInteractor()
        loginScreenViewController.loginScreenPresenter = loginScreenPresenter
        loginScreenPresenter.loginScreenViewController = loginScreenViewController
        loginScreenPresenter.loginScreenRouter = loginScreenRouter
        loginScreenPresenter.loginScreenInteractor = loginScreenInteractor
        loginScreenInteractor.loginScreenPresenter = loginScreenPresenter
    }
    
}
