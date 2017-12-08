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
    func executeGoogleLogin(loginScreenViewController: LoginScreenViewController)
    func executeFacebookLogin(loginScreenViewController: LoginScreenViewController)
}

class LoginScreenInteractor: NSObject, LoginScreenInteractorProtocol {
    
    var loginScreenPresenter: LoginScreenPresenter!
    
    func executeGoogleLogin(loginScreenViewController: LoginScreenViewController) {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = loginScreenViewController
        GIDSignIn.sharedInstance().signIn()
    }
    
    func executeFacebookLogin(loginScreenViewController: LoginScreenViewController) {
        LoginManager().logIn(readPermissions: [.publicProfile], viewController: loginScreenViewController, completion: { loginResult in
            switch loginResult {
            case .failed(let error):
                self.loginScreenPresenter.loginDidExecutedWithError(error: error.localizedDescription)
            case .cancelled:
                self.loginScreenPresenter.loginDidExecutedWithError(error: "User cancelled login")
            case .success(_, _, let accessToken):
                self.loginScreenPresenter.loginDidExecutedWithSuccess(token: accessToken.authenticationToken)
            }
        })
    }
    
}

extension LoginScreenInteractor: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            loginScreenPresenter.loginDidExecutedWithError(error: error.localizedDescription)
            return
        }
        guard let authentication = user.authentication else {
            loginScreenPresenter.loginDidExecutedWithError(error: "Response parsing error")
            return
        }
        loginScreenPresenter.loginDidExecutedWithSuccess(token: authentication.accessToken)
    }
    
}
