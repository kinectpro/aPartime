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
    func presentNewProjectsScreen(projectsScreenViewController: ProjectsScreenViewController, name: String)
    func presentNewProjectsScreen(projectsScreenViewController: ProjectsScreenViewController, name: String, description: String)
    func presentFeaturesScreen(projectsScreenViewController: ProjectsScreenViewController, project: String)
}

class ProjectsScreenRouter {
    func presentNewProjectsScreen(projectsScreenViewController: ProjectsScreenViewController, name: String) {
        if let createProjectViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
            
            createProjectViewController.nameProject = name
            projectsScreenViewController.present(createProjectViewController, animated: true)
        }
    }
    
    func presentNewProjectsScreen(projectsScreenViewController: ProjectsScreenViewController, name: String, description: String){
        if let createProjectViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
            
            createProjectViewController.category = "projects"
            createProjectViewController.nameProject = name
            createProjectViewController.descriptionProject = description
            projectsScreenViewController.present(createProjectViewController, animated: true)
        }
    }
    
    func presentFeaturesScreen(projectsScreenViewController: ProjectsScreenViewController, project: String) {
        if let featuresViewController = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "FeaturesScreenViewController") as? FeaturesScreenViewController{
            
            featuresViewController.project = project
            projectsScreenViewController.present(featuresViewController, animated: true)
        }        
    }
}

