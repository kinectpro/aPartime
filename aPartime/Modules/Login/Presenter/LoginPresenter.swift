//
//  LoginPresenter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol {
    func executeGoogleLogin()
    func executeFacebookLogin()
    func loginDidExecuteWithSuccess(user: User)
    func loginDidExecuteWithError(error: String)
}

class LoginPresenter: NSObject, LoginPresenterProtocol {
    
    var viewController: LoginViewController!
    var interactor: LoginInteractorProtocol!
    var router: LoginRouterProtocol!
    
    var user = User()
    
    func executeGoogleLogin() {
        interactor.executeGoogleLogin(viewController: viewController)
    }
    
    func executeFacebookLogin() {
        interactor.executeFacebookLogin(viewController: viewController)
    }
    
    func loginDidExecuteWithSuccess(user: User) {
        self.user = user
        router.goToProjectsModule(viewController: viewController)
    }
    
    func loginDidExecuteWithError(error: String) {
        router.goToLoginErrorPopup(error: error, viewController: viewController)
    }
    
}
