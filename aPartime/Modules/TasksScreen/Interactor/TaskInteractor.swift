//
//  TaskInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 13.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol TaskInteractorProtocol {
    
    func getAllTasks(featureName: String, success:@escaping (_ tasks:[String]) -> Void, fail:@escaping() -> Void)
}

class TaskInteractor: TaskInteractorProtocol {
    
    func getAllTasks(featureName: String, success:@escaping (_ tasks:[String]) -> Void, fail:@escaping() -> Void){
        DbManager.shared.defaultStore.collection("tasks").whereField("feature", isEqualTo: featureName).getDocuments() { (querySnapshot, err) in
            
            var tasksList = [String]()
            
            if let err = err {
                print("Error getting list of Tasks: \(err)")
                fail()
            } else {
                for document in querySnapshot!.documents {
                    tasksList.append(document.documentID)
                }
                success(tasksList)
            }
        }
    }
}
