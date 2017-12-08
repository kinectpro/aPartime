//
//  ProjectsScreenInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsScreenInteractorProtocol {
    func getAllProjects(  success:@escaping (_ projects:[String]) -> Void, fail:@escaping() -> Void)
    func getAllProjects() -> [String]
}

class ProjectsScreenInteractor: ProjectsScreenInteractorProtocol {
    
    
    
    func getAllProjects() -> [String] {
        return ["1"]
    }
    
    func getAllProjects(  success:@escaping (_ projects:[String]) -> Void, fail:@escaping() -> Void){
        DbManager.shared.defaultStore.collection("projects").getDocuments() { (querySnapshot, err) in
            
            var projectsNameList = [String]()
            
            if let err = err {
                print("Error getting list of PROJECTS: \(err)")
                fail()
            } else {
                for document in querySnapshot!.documents {
                    //print("\(document.documentID) => \(document.data())")
                    projectsNameList.append(document.data()["name"] as! String)
                }
                success(projectsNameList)
            }
        }
    }
    
    
}
