//
//  TabsPresenter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 26.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

class TabsPresenter: NSObject {
    
    var view: UITabBarController!
    
    override init() {
        super.init()
        setupDependencies()
        setupSubmodules()
    }
    
    func setupDependencies() {
        guard let viewController = UIStoryboard(name: "Tabs", bundle: nil).instantiateViewController(withIdentifier: "TabsView") as? UITabBarController else {
            return
        }
        view = viewController
    }
    
    func setupSubmodules() {
        guard let navigationView = NavigationPresenter().view else {
            return
        }
        view.viewControllers?.append(navigationView)
    }
    
}
