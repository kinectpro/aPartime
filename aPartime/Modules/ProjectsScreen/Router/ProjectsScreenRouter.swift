//
//  ProjectsScreenRouter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol ProjectsScreenRouterProtocol {
    func presentNewProjectsScreen(projectsScreenViewController: ProjectsScreenViewController)
}

class ProjectsScreenRouter {
    func presentNewProjectsScreen(projectsScreenViewController: ProjectsScreenViewController, name: String) {
        if let createProjectViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
            
            createProjectViewController.nameProject = name
            projectsScreenViewController.present(createProjectViewController, animated: true)
        }
    }
}

