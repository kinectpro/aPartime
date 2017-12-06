//
//  LoginScreenViewController.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    var loginScreenPresenter: LoginScreenPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        LoginScreenConfigurator.setupDependencies(loginScreenViewController: self)
    }

    @IBAction func gmailLoginButtonDidTap(_ sender: UIButton) {
        loginScreenPresenter.executeGmailLogin()
    }
    
    @IBAction func facebookLoginButtonDidTap(_ sender: UIButton) {
        loginScreenPresenter.executeFacebookLogin()
    }
    
}
