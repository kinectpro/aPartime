//
//  TasksViewController.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

protocol TasksViewProtocol {
    func showTasks(tasks: [TaskViewModel])
}

class TasksView: UIViewController, UITableViewDelegate, UITableViewDataSource, TasksViewProtocol {

    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tasksTableView: UITableView!
    
    var presenter: TasksPresenterProtocol!
    
    var tasks = [TaskViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
        presenter.getAllTasks()
    }
    
    func addViews() {
        let createBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createButtonDidTap))
        navigationItem.rightBarButtonItems = [createBarButtonItem]
    }
    
    func setupViews() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 190 / 255, green: 100 / 255, blue: 160 / 255, alpha: 1.0)
    }
    
    @objc func createButtonDidTap() {
        presenter.createTask()
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let task = tasks[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        if index == 0 {
            cell.topConstraint.constant = 8.0
        }
        if index == tasks.count - 1 {
            cell.bottomConstraint.constant = 8.0
        }
        cell.spentTime = task.spentTime
        cell.nameLabel.text = task.name
        cell.timeLabel.text = cell.stringFromTimeInterval(interval: task.spentTime) as String
        cell.playTappedHandler = {
            task.spentTime = cell.spentTime
            self.pauseAllTasks()
            if cell.isPause {
                cell.playButton.isSelected = false
                cell.taskTimer.pauseTimer()
                self.presenter.updateTask(task, status: TaskStatus.paused)
            }else{
                cell.playButton.isSelected = true
                cell.taskTimer.startTimer()
                self.presenter.updateTask(task, status: TaskStatus.started)
                
            }
            //self.presenter.editTask(task: task)
        }
        cell.stopTappedHandler = {
            cell.playButton.isSelected = false
            cell.taskTimer.pauseTimer()
            self.presenter.updateTask(task, status: TaskStatus.finished)
        }
        return cell
    }
    
    // MARK: TasksViewControllerProtocol implementation
    func showTasks(tasks: [TaskViewModel]) {
        self.tasks = tasks
        guard let tableView = tasksTableView else {
            return
        }
        tableView.reloadData()
    }
    
    func pauseAllTasks() {
        var i = 0
        for task in tasks {
            let cell = tasksTableView.cellForRow(at: IndexPath(item: i, section: 0)) as! TaskCell
            if !cell.isPause{
                cell.playButton.isSelected = false
                cell.taskTimer.pauseTimer()
                task.spentTime = cell.spentTime
                self.presenter.updateTask(task, status: TaskStatus.paused)
            }
            
            i += 1
        }
    }

}
