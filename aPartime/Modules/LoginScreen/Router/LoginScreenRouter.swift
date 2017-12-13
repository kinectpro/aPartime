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
    func presentProjectsScreen(viewController: LoginScreenViewController)
    func presentLoginErrorPopup(error: String, viewController: LoginScreenViewController)
}

class LoginScreenRouter: NSObject, LoginScreenRouterProtocol {
    
    func presentProjectsScreen(viewController: LoginScreenViewController) {
        if let projectsScreenViewController = UIStoryboard(name: "ProjectsScreen", bundle: nil).instantiateViewController(withIdentifier: "ProjectsScreenViewController") as? ProjectsScreenViewController {
            viewController.present(projectsScreenViewController, animated: true)
        }
    }
    
    func presentLoginErrorPopup(error: String, viewController: LoginScreenViewController) {
        AlertManager.shared.showAlert(title: "Login error", message: error, viewController: viewController)
    }
    
}
