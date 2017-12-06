//
//  ProjectsScreenInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol ProjectsScreenInteractorProtocol {
    func getAllProjects() -> [String]
}

class ProjectsScreenInteractor: ProjectsScreenInteractorProtocol {
    
    func getAllProjects() -> [String] {
        return ["MovieMates", "WriteMyEssay", "Pictaski", "Lahta"]
    }
    
    
}
