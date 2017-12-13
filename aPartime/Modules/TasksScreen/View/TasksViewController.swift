//
//  TasksViewController.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tasksPresenter: TaskPresenterProtocol!
    var feature = ""
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskConfigurator.setupDependencies(tasksViewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tasksPresenter.getAllTasks(featureName: feature, success: { (tasks) in
            self.data = tasks
            self.tableView.reloadData()
        }, fail: {
        })
    }
    
    //MARK: IBActions
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewTaskTapped(_ sender: UIButton) {
        tasksPresenter.createNewTask()
    }
    
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "taskCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TaskCell
        let name = data[indexPath.row]
        cell.nameLabel.text = name
        cell.startTappedHandler = {
            //cell.timeLabel.text = self.tasksPresenter.getStartTime()
        }
        cell.stopTappedHandler = {
            self.tasksPresenter.finishedTask(viewController: self, nameTask: name)
        }
        return cell
    }
    
    //MARK: UITableViewDelegate
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let cell = tableView.cellForRow(at: indexPath) as! TaskCell
//        guard let name = cell.nameLabel.text, !name.isEmpty else {return}
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }

}
