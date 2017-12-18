//
//  TasksScreenRouter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol TasksScreenRouterProtocol {
    func presentCreateEditScreen(task: Task, viewController: TasksScreenViewController)
    func presentGetTasksErrorPopup(error: String, viewController: TasksScreenViewController)
    
    func presentFinishedTaskScreen(viewController: TasksScreenViewController, nameTask: String, spentTime: String)
}

class TasksScreenRouter: NSObject, TasksScreenRouterProtocol {
    
    func presentCreateEditScreen(task: Task, viewController: TasksScreenViewController) {
        if let createEditScreenViewController = UIStoryboard(name: "CreateEditScreen", bundle: nil).instantiateViewController(withIdentifier: "CreateEditScreenViewController") as? CreateEditScreenViewController {
            createEditScreenViewController.item = Item(type: .task, name: task.name, description: task.description, parent: task.feature)
            viewController.present(createEditScreenViewController, animated: true)
        }
    }
    
    func presentGetTasksErrorPopup(error: String, viewController: TasksScreenViewController) {
        AlertManager.shared.showAlert(title: "Get tasks error", message: error, viewController: viewController)
    }
    
    
    func presentFinishedTaskScreen(viewController: TasksScreenViewController, nameTask: String, spentTime: String) {
        if let finishedTaskViewController = UIStoryboard(name: "Tasks", bundle: nil).instantiateViewController(withIdentifier: "TaskFinishedViewController") as? TaskFinishedViewController {
            finishedTaskViewController.nameTask = nameTask
            finishedTaskViewController.spentTime = spentTime
            finishedTaskViewController.feature = viewController.feature
            viewController.present(finishedTaskViewController, animated: true)
        }
    }
    
}
