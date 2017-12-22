//
//  TaskRouter.swift
//  aPartime
//
//  Created by Bobby numdevios on 13.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol TaskRouterProtocol {
    func presentNewTask(tasksViewController: TasksViewController)
    func presentFinishedTaskScreen(tasksViewController: TasksViewController, nameTask: String, spentTime: String)
}

class TaskRouter: TaskRouterProtocol {
    
    func presentNewTask(tasksViewController: TasksViewController) {
//        if let createTaskViewController = UIStoryboard(name: "CreateProject", bundle: nil).instantiateViewController(withIdentifier: "CreateProjectViewController") as? CreateProjectViewController {
//            
//            createTaskViewController.category = "tasks"
//            createTaskViewController.categoryName = tasksViewController.feature
//            tasksViewController.present(createTaskViewController, animated: true)
//        }
    }
    
    func presentFinishedTaskScreen(tasksViewController: TasksViewController, nameTask: String, spentTime: String) {
        if let finishedTaskViewController = UIStoryboard(name: "Tasks", bundle: nil).instantiateViewController(withIdentifier: "TaskFinishedViewController") as? TaskFinishedViewController {
              finishedTaskViewController.nameTask = nameTask
              finishedTaskViewController.spentTime = spentTime
              finishedTaskViewController.feature = tasksViewController.feature
              tasksViewController.present(finishedTaskViewController, animated: true)
        }
    }
}
