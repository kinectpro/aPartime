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
    
    func finishedTask(viewController: TasksScreenViewController, nameTask: String, spentTime: Double)
    func saveStartTime(taskName: String, featureName: String)
    func saveSpentTime(taskName: String, featureName: String, spentTime: Double, isPause: Bool)
    func saveStopTime(featureName: String, taskName: String, description: String)
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
    
    func finishedTask(viewController: TasksScreenViewController, nameTask: String, spentTime: Double) {
        let time = stringFromTimeInterval(interval: spentTime) as String
        router.presentFinishedTaskScreen(viewController: viewController, nameTask: nameTask, spentTime: time)
    }
    
    func saveStartTime(taskName: String, featureName: String) {
        interactor.saveStartTime(taskName: taskName, featureName: featureName, success: {
            print("Save start time of task is success!")
        }) { }
    }
    
    func saveSpentTime(taskName: String, featureName: String, spentTime: Double, isPause: Bool) {
        interactor.saveSpentTime(taskName: taskName, featureName: featureName, spentTime: spentTime, isPause: isPause, success: {
            print("Save spent time of task is success!")
        }) {}
    }
    
    func saveStopTime(featureName: String, taskName: String, description: String) {
        interactor.saveStopTime(taskName: taskName, featureName: featureName, description: description, success: {
            print("Save close task is success!")
        }) {}
    }
    
    func stringFromTimeInterval(interval: Double) -> NSString {
        let hours = (Int(interval) / 3600)
        let minutes = Int(interval / 60) - Int(hours * 60)
        let seconds = Int(interval) - (Int(interval / 60) * 60)
        return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
    
}
