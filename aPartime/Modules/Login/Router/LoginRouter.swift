//
//  LoginRouter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouterProtocol {
    func goToProjectsModule(viewController: LoginViewController)
    func goToLoginErrorPopup(error: String, viewController: LoginViewController)
}

class LoginRouter: NSObject, LoginRouterProtocol {
    
    func goToProjectsModule(viewController: LoginViewController) {
        if let projectsViewController = UIStoryboard(name: "Projects", bundle: nil).instantiateViewController(withIdentifier: "ProjectsViewController") as? ProjectsViewController {
            viewController.present(projectsViewController, animated: true)
        }
    }
    
    func goToLoginErrorPopup(error: String, viewController: LoginViewController) {
        AlertManager.shared.showAlert(title: "Login error", message: error, viewController: viewController)
    }
    
}
