//
//  LoginScreenPresenter.swift
//  aPartime
//
//  Created by Bobby numdevios on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol LoginScreenPresenterProtocol {
    func loginScreenDidLoad()
}

class LoginScreenPresenter: LoginScreenPresenterProtocol {
    
    var loginScreenViewController()
    
    func loginScreenDidLoad() {
        print("loginScreenDidLoad")
    }
}
