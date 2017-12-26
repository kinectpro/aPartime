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
    
    var view: LoginView!
    var interactor: LoginInteractorProtocol!
    var router: LoginRouterProtocol!
    
    var user = User()
    
    override init() {
        super.init()
        setupDependencies()
    }
    
    func setupDependencies() {
        guard let view = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginView") as? LoginView else {
            return
        }
        let interactor = LoginInteractor()
        let router = LoginRouter()
        view.presenter = self
        interactor.presenter = self
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func executeGoogleLogin() {
        interactor.executeGoogleLogin(view: view)
    }
    
    func executeFacebookLogin() {
        interactor.executeFacebookLogin(view: view)
    }
    
    func loginDidExecuteWithSuccess(user: User) {
        self.user = user
        router.goToTabsModule(view: view)
    }
    
    func loginDidExecuteWithError(error: String) {
        router.goToLoginErrorPopup(error: error, view: view)
    }
    
}
