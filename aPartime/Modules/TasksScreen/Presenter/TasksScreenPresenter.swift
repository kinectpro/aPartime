//
//  TasksScreenPresenter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol TasksScreenPresenterProtocol {
    func getAllTasks(inFeature: Feature)
    func createNewTask()
    func editTask(task: TaskViewModel)
    func tasksDidGetWithSuccess(tasks: [Task])
    func tasksDidGetWithError(error: String)
}

class TasksScreenPresenter: NSObject, TasksScreenPresenterProtocol {
    
    var viewController: TasksScreenViewController!
    var router: TasksScreenRouter!
    var interactor: TasksScreenInteractorProtocol!
    
    var tasks = [Task]()
    var feature = Feature()
    
    func getAllTasks(inFeature: Feature) {
        self.feature = inFeature
        interactor.getAllTasks(inFeature: feature)
    }
    
    func createNewTask(){
        router.presentCreateEditScreen(task: Task(feature: feature.name), viewController: viewController)
    }
    
    func editTask(task: TaskViewModel){
        if let task = tasks.filter({ $0.name == task.name }).first {
            router.presentCreateEditScreen(task: task, viewController: viewController)
        }
    }
    
    func tasksDidGetWithSuccess(tasks: [Task]) {
        self.tasks = tasks
        let taskViewModels = tasks.flatMap({ TaskViewModel(name: $0.name) })
        viewController.showTasks(tasks: taskViewModels)
    }
    
    func tasksDidGetWithError(error: String) {
        router.presentGetTasksErrorPopup(error: error, viewController: viewController)
    }
    
}
