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
}

class LoginScreenRouter: LoginScreenRouterProtocol {
    
    func presentProjectsScreen(loginScreenViewController: LoginScreenViewController) {
        if let projectsScreenViewController = UIStoryboard(name: "ProjectsScreen", bundle: nil).instantiateViewController(withIdentifier: "ProjectsScreenViewController") as? ProjectsScreenViewController {
            loginScreenViewController.present(projectsScreenViewController, animated: true)
        }
    }
    
}
