//
//  TasksRouter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol TasksRouterProtocol {
    func goToCreateEditModule(task: Task, view: TasksView)
    func goToGetTasksErrorPopup(error: String, view: TasksView)
    func presentFinishedTaskScreen(tasksViewController: TasksView, task: TaskViewModel, feature: String)
}

class TasksRouter: NSObject, TasksRouterProtocol {
    
    func goToCreateEditModule(task: Task, view: TasksView) {
        let type = ItemType.task
        let id = task.id
        let name = task.name
        let description = task.description
        let parent = task.feature
        let item = Item(type: type, id: id, name: name, description: description, parent: parent)
        CreateEditPresenter().present(item: item, viewController: view)
    }
    
    func goToGetTasksErrorPopup(error: String, view: TasksView) {
        AlertManager.shared.showAlert(title: "Get tasks error", message: error, viewController: view)
    }
    
    func presentFinishedTaskScreen(tasksViewController: TasksView, task: TaskViewModel, feature: String) {
        if let finishedTaskViewController = UIStoryboard(name: "Tasks", bundle:nil).instantiateViewController(withIdentifier: "TaskFinishedViewController") as? TaskFinishedViewController {
            finishedTaskViewController.task = task
            finishedTaskViewController.feature = feature
            finishedTaskViewController.presenter = tasksViewController.presenter as! TasksPresenter
            tasksViewController.present(finishedTaskViewController, animated: true)
        }
    }
}
