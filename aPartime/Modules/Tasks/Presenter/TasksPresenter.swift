//
//  TasksPresenter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol TasksPresenterProtocol {
    func getAllTasks()
    func tasksDidGetWithSuccess(tasks: [Task])
    func tasksDidGetWithError(error: String)
    func createTask()
    func editTask(task: TaskViewModel)
    func dataDidSaveWithSuccess()
    func dataDidSaveWithError(error: String)
    func updateTask(_ task: TaskViewModel, status: TaskStatus)
}

class TasksPresenter: NSObject, TasksPresenterProtocol {
    
    var view: TasksView!
    var router: TasksRouter!
    var interactor: TasksInteractorProtocol!
    
    var tasks = [Task]()
    var feature = Feature()
    
    init(feature: Feature) {
        super.init()
        setupDependencies()
        self.feature = feature
    }
    
    func setupDependencies() {
        guard let view = UIStoryboard(name: "Tasks", bundle: nil).instantiateViewController(withIdentifier: "TasksView") as? TasksView else {
            return
        }
        let interactor = TasksInteractor()
        let router = TasksRouter()
        view.presenter = self
        interactor.presenter = self
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getAllTasks() {
        interactor.getAllTasks(forFeature: feature)
    }
    
    func tasksDidGetWithSuccess(tasks: [Task]) {
        self.tasks = tasks
        let taskViewModels = tasks.flatMap({ TaskViewModel(id: $0.id, name: $0.name, spentTime: $0.spentTime) })
        view.showTasks(tasks: taskViewModels)
    }
    
    func tasksDidGetWithError(error: String) {
        router.goToGetTasksErrorPopup(error: error, view: view)
    }
    
    func createTask(){
        let task = Task(feature: feature.id)
        router.goToCreateEditModule(task: task, view: view)
    }
    
    func editTask(task: TaskViewModel){
        if let task = tasks.filter({ $0.id == task.id }).first {
            router.goToCreateEditModule(task: task, view: view)
        }
    }
    
    func updateTask(_ task: TaskViewModel, status: TaskStatus) {
        let taskCurrent = Task()
        taskCurrent.id = task.id
        taskCurrent.name  = task.name
        taskCurrent.spentTime = task.spentTime
        taskCurrent.status = status
        taskCurrent.feature = self.feature.id
        interactor.updateTask(taskCurrent)
    }
    
    func dataDidSaveWithSuccess() {
        print("SUCCESS")
    }
    
    func dataDidSaveWithError(error: String) {
        print("ERROR")
    }
}
