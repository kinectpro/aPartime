//
//  LoginScreenPresenter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol LoginScreenPresenterProtocol {
    func executeGoogleLogin()
    func executeFacebookLogin()
    func loginDidExecuteWithSuccess(token: String)
    func loginDidExecuteWithError(error: String)
}

class LoginScreenPresenter: NSObject, LoginScreenPresenterProtocol {
    
    var viewController: LoginScreenViewController!
    var interactor: LoginScreenInteractorProtocol!
    var router: LoginScreenRouterProtocol!
    
    var token: String?
    
    func executeGoogleLogin() {
        interactor.executeGoogleLogin(viewController: viewController)
    }
    
    func executeFacebookLogin() {
        interactor.executeFacebookLogin(viewController: viewController)
    }
    
    func loginDidExecuteWithSuccess(token: String) {
        self.token = token
        router.presentProjectsScreen(viewController: viewController)
    }
    
    func loginDidExecuteWithError(error: String) {
        router.presentLoginErrorPopup(error: error, viewController: viewController)
    }
    
}
