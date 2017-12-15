//
//  TasksScreenInteractor.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol TasksScreenInteractorProtocol {
    func getAllTasks(forFeature: Feature)
}

class TasksScreenInteractor: NSObject, TasksScreenInteractorProtocol {
    
    var presenter: TasksScreenPresenterProtocol!
    
    func getAllTasks(forFeature: Feature) {
        DbManager.shared.defaultStore.collection("tasks").whereField("feature", isEqualTo: forFeature.name).getDocuments() { (querySnapshot, error) in
            if let error = error {
                self.presenter.tasksDidGetWithError(error: error.localizedDescription)
                return
            }
            guard let querySnapshot = querySnapshot else {
                self.presenter.tasksDidGetWithError(error: "Get features error")
                return
            }
            var tasks = [Task]()
            for document in querySnapshot.documents {
                if let description = document.data()["description"] as? String, let feature = document.data()["feature"] as? String {
                    let name = document.documentID
                    let task = Task(name: name, description: description, feature: feature)
                    tasks.append(task)
                }
            }
            self.presenter.tasksDidGetWithSuccess(tasks: tasks)
        }
    }
    
}
