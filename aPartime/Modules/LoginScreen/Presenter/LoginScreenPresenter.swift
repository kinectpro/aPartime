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
    func loginDidExecutedWithSuccess(token: String)
    func loginDidExecutedWithError(error: String)
}

class LoginScreenPresenter: NSObject, LoginScreenPresenterProtocol {
    
    var loginScreenViewController: LoginScreenViewController!
    var loginScreenInteractor: LoginScreenInteractor!
    var loginScreenRouter: LoginScreenRouter!
    
    var token: String?
    
    func executeGoogleLogin() {
        loginScreenInteractor.executeGoogleLogin(loginScreenViewController: loginScreenViewController)
    }
    
    func executeFacebookLogin() {
        loginScreenInteractor.executeFacebookLogin(loginScreenViewController: loginScreenViewController)
    }
    
    func loginDidExecutedWithSuccess(token: String) {
        self.token = token
        loginScreenRouter.presentProjectsScreen(loginScreenViewController: loginScreenViewController)
    }
    
    func loginDidExecutedWithError(error: String) {
        loginScreenRouter.presentLoginErrorPopup(error: error, loginScreenViewController: loginScreenViewController)
    }
    
}
