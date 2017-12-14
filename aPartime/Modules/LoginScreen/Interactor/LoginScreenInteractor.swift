//
//  LoginScreenInteractor.swift
//  aPartime
//
//  Created by Sergey Kobzin on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import GoogleSignIn
import FacebookCore
import FacebookLogin
import Firebase
import Foundation

protocol LoginScreenInteractorProtocol {
    func executeGoogleLogin(viewController: LoginScreenViewController)
    func executeFacebookLogin(viewController: LoginScreenViewController)
}

class LoginScreenInteractor: NSObject, LoginScreenInteractorProtocol {
    
    var presenter: LoginScreenPresenterProtocol!
    
    func executeGoogleLogin(viewController: LoginScreenViewController) {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = viewController
        GIDSignIn.sharedInstance().signIn()
    }
    
    func executeFacebookLogin(viewController: LoginScreenViewController) {
        LoginManager().logIn(readPermissions: [.publicProfile], viewController: viewController, completion: { loginResult in
            switch loginResult {
            case .failed(let error):
                self.presenter.loginDidExecuteWithError(error: error.localizedDescription)
            case .cancelled:
                self.presenter.loginDidExecuteWithError(error: "User cancelled login")
            case .success(_, _, let accessToken):
                self.presenter.loginDidExecuteWithSuccess(token: accessToken.authenticationToken)
            }
        })
    }
    
}

extension LoginScreenInteractor: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            presenter.loginDidExecuteWithError(error: error.localizedDescription)
            return
        }
        guard let authentication = user.authentication else {
            presenter.loginDidExecuteWithError(error: "Response parsing error")
            return
        }
        presenter.loginDidExecuteWithSuccess(token: authentication.accessToken)
    }
    
}
