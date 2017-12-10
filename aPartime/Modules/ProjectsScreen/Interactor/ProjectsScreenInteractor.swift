//
//  ProjectsScreenInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsScreenInteractorProtocol {
    func getAllProjects(  success:@escaping (_ projects:[Project]) -> Void, fail:@escaping() -> Void)
    func getAllProjects() -> [String]
    func addNewProject(name: String)
}

class ProjectsScreenInteractor: ProjectsScreenInteractorProtocol {
    
    
    
    func getAllProjects() -> [String] {
        return ["1"]
    }
    
    func getAllProjects(  success:@escaping (_ projects:[Project]) -> Void, fail:@escaping() -> Void){
        DbManager.shared.defaultStore.collection("projects").getDocuments() { (querySnapshot, err) in
            
            var projectsList = [Project]()
            
            if let err = err {
                print("Error getting list of PROJECTS: \(err)")
                fail()
            } else {
                for document in querySnapshot!.documents {
                    //print("\(document.documentID) => \(document.data())")
                    var project = Project()
                    project.name = document.documentID
                    project.descriptionProject = document.data()["description"] as? String
                    projectsList.append(project)
                }
                success(projectsList)
            }
        }
    }
    
    func addNewProject(name: String) {
        DbManager.shared.defaultStore.collection("projects").addDocument(data: ["name":name])
    }
    
    
}
