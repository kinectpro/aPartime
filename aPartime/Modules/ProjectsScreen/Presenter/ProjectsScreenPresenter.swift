//
//  ProjectsScreenPresenter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsScreenPresenterProtocol {
    func getAllProjects() -> [String]
    func createNewProject()
    func editProject(name: String)
}

class ProjectsScreenPresenter: ProjectsScreenPresenterProtocol {
    
    var projectsScreenViewController: ProjectsScreenViewController!
    var projectsScreenRouter: ProjectsScreenRouter!
    var projectsScreenInteractor: ProjectsScreenInteractorProtocol!
    
    func getAllProjects() -> [String]{
        return projectsScreenInteractor.getAllProjects()
    }
    
    func createNewProject(){
        projectsScreenRouter.presentNewProjectsScreen(projectsScreenViewController: projectsScreenViewController, name:"")
    }
    func editProject(name: String){
            
        projectsScreenRouter.presentNewProjectsScreen(projectsScreenViewController: projectsScreenViewController, name: name)
    }
}
