//
//  LoginScreenViewController.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import GoogleSignIn
import UIKit

class LoginScreenViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var facebookLoginButton: UIButton!
    
    var presenter: LoginScreenPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        LoginScreenConfigurator.setupDependencies(viewController: self)
        setupViews()
    }

    @IBAction func googleLoginButtonDidTap(_ sender: UIButton) {
        presenter.executeGoogleLogin()
    }
    
    @IBAction func facebookLoginButtonDidTap(_ sender: UIButton) {
        presenter.executeFacebookLogin()
    }
    
    func setupViews() {
        googleLoginButton.layer.cornerRadius = 5.0
        googleLoginButton.layer.borderWidth = 1.0
        googleLoginButton.layer.borderColor = UIColor.lightGray.cgColor
        facebookLoginButton.layer.cornerRadius = 5.0
    }
    
}
