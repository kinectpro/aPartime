//
//  TasksRouter.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol TasksRouterProtocol {
    func goToCreateEditModule(task: Task, view: TasksView)
    func goToGetTasksErrorPopup(error: String, view: TasksView)
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
    
}
