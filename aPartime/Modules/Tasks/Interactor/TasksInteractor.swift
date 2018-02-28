//
//  TasksScreenInteractor.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import Firebase

protocol TasksInteractorProtocol {
    func getAllTasks(forFeature: Feature)
    func updateTask(_ task:Task)
}

class TasksInteractor: NSObject, TasksInteractorProtocol {
    
    var presenter: TasksPresenterProtocol!
    
    func getAllTasks(forFeature feature: Feature) {
        DbManager.shared.defaultStore.collection("tasks").whereField("feature", isEqualTo: feature.id).getDocuments() { (querySnapshot, error) in
            if let error = error {
                self.presenter.tasksDidGetWithError(error: error.localizedDescription)
                return
            }
            guard let querySnapshot = querySnapshot else {
                self.presenter.tasksDidGetWithError(error: "Get tasks error")
                return
            }
            let tasks = querySnapshot.documents.map({ (document) -> Task in
                let id = document.documentID
                let name = document.data()["name"] as? String ?? ""
                let description = document.data()["description"] as? String ?? ""
                let feature = document.data()["feature"] as? String ?? ""
                let spentTime = document.data()["spentTime"] as? Double ?? 0.0
                let created = document.data()["created"] as? Date ?? Date()
                let modified = document.data()["modified"] as? Date ?? Date()
                let started = document.data()["started"] as? Date ?? Date()
                let paused = document.data()["paused"] as? Date ?? Date()
                let unpaused = document.data()["unpaused"] as? Date ?? Date()
                let finished = document.data()["finished"] as? Date ?? Date()
                let task = Task(id: id, name: name, description: description, feature: feature, spentTime: spentTime, created: created, modified: modified, started: started, paused: paused, unpaused: unpaused, finished: finished)
                return task
            }).sorted(by: { $0.modified > $1.modified })
            self.presenter.tasksDidGetWithSuccess(tasks: tasks)
        }
    }
    
    func updateTask(_ task: Task) {
        let data = ["name"        : task.name,
                    "description" : task.description,
                    "feature"     : task.feature,
                    "spentTime"   : task.spentTime,
                    "status"      : task.status.rawValue,
                    "modified"    : Date()] as [String : Any]
        
        DbManager.shared.defaultStore.collection("tasks").document(task.id).setData(data, options: SetOptions.merge()) { err in
            if let err = err {
                self.presenter.dataDidSaveWithError(error: err.localizedDescription)
                return
            }
            
            self.presenter.dataDidSaveWithSuccess()
        }
    }
    
}
