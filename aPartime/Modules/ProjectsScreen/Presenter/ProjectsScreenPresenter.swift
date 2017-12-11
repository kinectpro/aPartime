//
//  ProjectsScreenPresenter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsScreenPresenterProtocol {
    //func getAllProjects() -> [String]
    func getAllProjects(  success:@escaping (_ projects:[Project]) -> Void, fail:@escaping() -> Void)
    func createNewProject()
    func editProject(name: String, description: String)
    func openFeaturesFor(project: String)
}

class ProjectsScreenPresenter: ProjectsScreenPresenterProtocol {
    
    var projectsScreenViewController: ProjectsScreenViewController!
    var projectsScreenRouter: ProjectsScreenRouter!
    var projectsScreenInteractor: ProjectsScreenInteractorProtocol!
    
//    func getAllProjects() -> [String]{
//        return projectsScreenInteractor.getAllProjects()
//    }
    
    func getAllProjects(  success:@escaping (_ projects:[Project]) -> Void, fail:@escaping() -> Void){
        self.projectsScreenInteractor.getAllProjects(success: { (projectsList) in
            success(projectsList)
        }) {
            fail()
        }
    }
    
    func createNewProject(){
        projectsScreenRouter.presentNewProjectsScreen(projectsScreenViewController: projectsScreenViewController, name:"")
    }
    func editProject(name: String, description: String){
            
        //projectsScreenRouter.presentNewProjectsScreen(projectsScreenViewController: projectsScreenViewController, name: name)
        projectsScreenRouter.presentNewProjectsScreen(projectsScreenViewController: projectsScreenViewController, name: name, description: description)
    }
    
    func openFeaturesFor(project: String) {
        projectsScreenRouter.presentFeaturesScreen(projectsScreenViewController: projectsScreenViewController, project: project)    }
}
