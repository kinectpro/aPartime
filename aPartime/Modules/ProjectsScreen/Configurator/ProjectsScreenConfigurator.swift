//
//  ProjectsScreenConfigurator.swift
//  aPartime
//
//  Created by Sergey Kobzin on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class ProjectsScreenConfigurator {
    
    static func setupDependencies(projectsScreenViewController: ProjectsScreenViewController) {
        let projectsScreenPresenter = ProjectsScreenPresenter()
        let projectsScreenRouter = ProjectsScreenRouter()
        projectsScreenPresenter.projectsScreenViewController = projectsScreenViewController
        projectsScreenPresenter.projectsScreenRouter = projectsScreenRouter
    }
    
}
