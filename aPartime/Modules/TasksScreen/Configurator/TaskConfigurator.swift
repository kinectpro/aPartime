//
//  TaskConfigurator.swift
//  aPartime
//
//  Created by Bobby numdevios on 13.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

class TaskConfigurator {
    
    static func setupDependencies(tasksViewController: TasksViewController) {
        let taskPresenter = TaskPresenter()
        let taskRouter = TaskRouter()
        let taskInteractor = TaskInteractor()
        
        tasksViewController.tasksPresenter = taskPresenter
        taskPresenter.tasksViewController = tasksViewController
        taskPresenter.tasksRouter = taskRouter
        taskPresenter.tasksInteractor = taskInteractor
        
    }
    
    static func setupDependencies(viewController: TaskFinishedViewController) {
        let taskPresenter = TaskPresenter()
        let taskRouter = TaskRouter()
        let taskInteractor = TaskInteractor()
        
        viewController.tasksPresenter = taskPresenter
        //taskPresenter.tasksViewController = viewController
        taskPresenter.tasksRouter = taskRouter
        taskPresenter.tasksInteractor = taskInteractor
        
    }
}
