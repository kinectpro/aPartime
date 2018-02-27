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
        cell.nameLabel.text = task.name
        cell.playTappedHandler = {
            //self.presenter.editTask(task: task)
        }
        cell.stopTappedHandler = {
            
        }
        return cell
    }
    
    // MARK: TasksViewControllerProtocol implementation
    func showTasks(tasks: [TaskViewModel]) {
        self.tasks = tasks
        tasksTableView.reloadData()
    }

}
