//
//  LoginScreenRouter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol LoginScreenRouterProtocol {
    func presentProjectsScreen(loginScreenViewController: LoginScreenViewController)
    func presentLoginErrorPopup(error: String, loginScreenViewController: LoginScreenViewController)
}

class LoginScreenRouter: NSObject, LoginScreenRouterProtocol {
    
    func presentProjectsScreen(loginScreenViewController: LoginScreenViewController) {
        if let projectsScreenViewController = UIStoryboard(name: "ProjectsScreen", bundle: nil).instantiateViewController(withIdentifier: "ProjectsScreenViewController") as? ProjectsScreenViewController {
            loginScreenViewController.present(projectsScreenViewController, animated: true)
        }
    }
    
    func presentLoginErrorPopup(error: String, loginScreenViewController: LoginScreenViewController) {
        let alertController = UIAlertController(title: "Login Error", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        loginScreenViewController.present(alertController, animated: true)
    }
    
}
