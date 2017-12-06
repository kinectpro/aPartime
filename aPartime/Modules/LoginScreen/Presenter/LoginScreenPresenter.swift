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
    func executeGmailLogin()
    func executeFacebookLogin()
}

class LoginScreenPresenter: LoginScreenPresenterProtocol {
    
    var loginScreenViewController: LoginScreenViewController!
    var loginScreenRouter: LoginScreenRouter!
    
    func executeGmailLogin() {
        loginScreenRouter.presentProjectsScreen(loginScreenViewController: loginScreenViewController)
    }
    
    func executeFacebookLogin() {
        loginScreenRouter.presentProjectsScreen(loginScreenViewController: loginScreenViewController)
    }
    
}
