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
                let request = GraphRequest(graphPath: "me", parameters: ["fields" : "email, name"], accessToken: accessToken, httpMethod: .GET, apiVersion: FacebookCore.GraphAPIVersion.defaultVersion)
                request.start { (response, result) in
                    switch result {
                    case .failed(let error):
                        self.presenter.loginDidExecuteWithError(error: error.localizedDescription)
                    case .success(let value):
                        guard let profile = value.dictionaryValue, let name = profile["name"] as? String, let id = profile["email"] as? String ?? profile["id"] as? String else {
                            self.presenter.loginDidExecuteWithError(error: "Login data parsing error")
                            return
                        }
                        let user = User(id: id, name: name, role: .developer)
                        self.presenter.loginDidExecuteWithSuccess(user: user)
                        return
                    }
                }
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
        guard let profile = user.profile, let name = profile.name, let id = profile.email else {
            presenter.loginDidExecuteWithError(error: "Login data parsing error")
            return
        }
        let user = User(id: id, name: name, role: .developer)
        presenter.loginDidExecuteWithSuccess(user: user)
    }
    
}
