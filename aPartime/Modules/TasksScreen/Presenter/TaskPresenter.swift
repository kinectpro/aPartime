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
    func getAllTasks(featureName: String, success:@escaping (_ tasks:[Task]) -> Void, fail:@escaping() -> Void)
    func finishedTask(viewController: TasksViewController, nameTask: String, spentTime: Double)
    func stringFromTimeInterval(interval: Double) -> NSString
    func saveStartTime(taskName: String, featureName: String)
    func saveSpentTime(taskName: String, featureName: String, spentTime: Double, isPause: Bool)
    func saveStopTime(featureName: String, taskName: String, description: String)

}

class TaskPresenter: TaskPresenterProtocol {
 
    var tasksViewController: TasksViewController!
    var tasksRouter: TaskRouter!
    var tasksInteractor: TaskInteractorProtocol!
    var timerHandler: ()->Void = {}
    var timerTask : Timer?
    var featureName: String?
    
    func createNewTask() {
        //featureName = tasksViewController.feature
        tasksRouter.presentNewTask(tasksViewController: tasksViewController)
    }
    
    func getAllTasks(featureName: String, success:@escaping (_ tasks:[Task]) -> Void, fail:@escaping() -> Void) {
        tasksInteractor.getAllTasks(featureName: featureName, success: { (tasksList) in
            success(tasksList)
        }){
            fail()
        }
    }
    
    func finishedTask(viewController: TasksViewController, nameTask: String, spentTime: Double) {
        let time = stringFromTimeInterval(interval: spentTime) as String
        tasksRouter.presentFinishedTaskScreen(tasksViewController: viewController, nameTask: nameTask, spentTime: time)
    }
    
    func saveStartTime(taskName: String, featureName: String) {
        self.tasksInteractor.saveStartTime(taskName: taskName, featureName: featureName, success: {
            print("Save start time of task is success!")
        }) { }
    }
    
    func saveSpentTime(taskName: String, featureName: String, spentTime: Double, isPause: Bool){
        self.tasksInteractor.saveSpentTime(taskName: taskName, featureName: featureName, spentTime: spentTime, isPause: isPause, success: {
            print("Save spent time of task is success!")
        }) {}
    }
    
    func saveStopTime(featureName: String, taskName: String, description: String){
        self.tasksInteractor.saveStopTime(taskName: taskName, featureName: featureName, description: description, success: {
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
