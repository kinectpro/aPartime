//
//  NavigationPresenter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 26.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class NavigationPresenter: NSObject {
    
    var view: UINavigationController!
    
    override init() {
        super.init()
        setupDependencies()
        setupSubmodules()
    }
    
    func setupDependencies() {
        guard let view = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "NavigationView") as? UINavigationController else {
            return
        }
        self.view = view
    }
    
    func setupSubmodules() {
        guard let projectsView = ProjectsPresenter().view else {
            return
        }
        view.pushViewController(projectsView, animated: false)
    }
    
}
