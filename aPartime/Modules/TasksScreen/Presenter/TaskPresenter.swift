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
    func startTimer ()
    func pauseTimer()
    func stringFromTimeInterval(interval: Double) -> NSString
    //func getStartTime() -> String
}

class TaskPresenter: TaskPresenterProtocol {
 
    var tasksViewController: TasksViewController!
    var tasksRouter: TaskRouter!
    var tasksInteractor: TaskInteractorProtocol!
    var timerHandler: ()->Void = {}
    var timerTask : Timer?
    //var spentTime: Double = 0.0
    
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
    
    func startTimer () {
        
        if timerTask == nil {
            timerTask = Timer.scheduledTimer(
                timeInterval: TimeInterval(1.0),
                target      : self,
                selector    : #selector(timerAction),
                userInfo    : nil,
                repeats     : true)
        }
    }
    
    @objc func timerAction(){
        timerHandler()
    }
    
    func pauseTimer() {
        if timerTask != nil {
            timerTask?.invalidate()
            timerTask = nil
            //startDate = nil
        }
    }
    
    func stringFromTimeInterval(interval: Double) -> NSString {
        
        let hours = (Int(interval) / 3600)
        let minutes = Int(interval / 60) - Int(hours * 60)
        let seconds = Int(interval) - (Int(interval / 60) * 60)
        
        return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
    
//    func getStartTime() -> String {
//        let startTime = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm"
//        let timeString = dateFormatter.string(from: startTime)
//        print(timeString)
//
//        return timeString
//    }
}
