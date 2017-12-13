//
//  TaskPresenter.swift
//  aPartime
//
//  Created by Bobby numdevios on 13.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol TaskPresenterProtocol {
    func createNewTask()
    func getAllTasks(featureName: String, success:@escaping (_ tasks:[String]) -> Void, fail:@escaping() -> Void)
    func finishedTask(viewController: TasksViewController, nameTask: String)
    func getStartTime() -> String
}

class TaskPresenter: TaskPresenterProtocol {
 
    var tasksViewController: TasksViewController!
    var tasksRouter: TaskRouter!
    var tasksInteractor: TaskInteractorProtocol!
    
    func createNewTask() {
        tasksRouter.presentNewTask(tasksViewController: tasksViewController)
    }
    
    func getAllTasks(featureName: String, success:@escaping (_ tasks:[String]) -> Void, fail:@escaping() -> Void) {
        tasksInteractor.getAllTasks(featureName: featureName, success: { (tasksList) in
            success(tasksList)
        }){
            fail()
        }
    }
    
    func finishedTask(viewController: TasksViewController, nameTask: String) {
        tasksRouter.presentFinishedTaskScreen(tasksViewController: tasksViewController, nameTask: nameTask)
    }
    
    func getStartTime() -> String {
        let startTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: startTime)
        print(timeString)
        
        return timeString
    }
}
