//
//  LoginRouter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol LoginRouterProtocol {
    func goToTabsModule(view: LoginView)
    func goToLoginErrorPopup(error: String, view: LoginView)
}

class LoginRouter: NSObject, LoginRouterProtocol {
    
    func goToTabsModule(view: LoginView) {
        guard let tabsView = TabsPresenter().view else {
            return
        }
        view.present(tabsView, animated: true)
    }
    
    func goToLoginErrorPopup(error: String, view: LoginView) {
        AlertManager.shared.showAlert(title: "Login error", message: error, viewController: view)
    }
    
}
