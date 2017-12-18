//
//  TasksScreenViewController.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

protocol TasksScreenViewControllerProtocol {
    func showTasks(tasks: [TaskViewModel])
}

class TasksScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TasksScreenViewControllerProtocol {

    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tasksTableView: UITableView!
    
    var presenter: TasksScreenPresenterProtocol!
    
    var tasks = [TaskViewModel]()
    var feature = Feature()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TasksScreenConfigurator.setupDependencies(viewController: self)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getAllTasks(inFeature: feature)
    }
    
    func setupViews() {
        navigationBarView.layer.shadowColor = UIColor.darkGray.cgColor
        navigationBarView.layer.shadowOpacity = 0.6
        navigationBarView.layer.shadowOffset = CGSize.zero
        navigationBarView.layer.shadowRadius = 4
    }
    
    //MARK: IBActions
    @IBAction func addNewTapped(_ sender: UIButton) {
        presenter.createNewTask()
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        let task = tasks[index]
        if index == 0 {
            cell.topConstraint.constant = 8.0
        }
        if index == tasks.count - 1 {
            cell.bottomConstraint.constant = 8.0
        }
        cell.nameLabel.text = task.name
//        cell.editTappedHandler = {
//            self.presenter.editTask(task: task)
//        }
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
    }
    
    // MARK: FeaturesScreenViewControllerProtocol implementation
    func showTasks(tasks: [TaskViewModel]) {
        self.tasks = tasks
        tasksTableView.reloadData()
    }

}
