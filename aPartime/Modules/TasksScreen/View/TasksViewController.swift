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
    var tasksPresenter: TaskPresenter!
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
        cell.taskTimer = TaskTimer()
        cell.nameLabel.text = name
        cell.startTappedHandler = {
            self.pauseAllTasks()
            if cell.isPause {
                cell.startPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
                cell.taskTimer.startTimer()
            }else{
                //cell.isPause = !cell.isPause
                cell.taskTimer.pauseTimer()
            }
            //cell.isPause = !cell.isPause
        }
        cell.taskTimer.timerHandler = {
            cell.trackingTime()
        }

        cell.stopTappedHandler = {
            
            self.tasksPresenter.finishedTask(viewController: self, nameTask: name)
        }
        
        return cell
    }
    
    func pauseAllTasks() {
        var i = 0
        for _ in data {
            let cell = tableView.cellForRow(at: IndexPath(item: i, section: 0)) as! TaskCell
            //cell.isPause = !cell.isPause
            cell.startPauseButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            if cell.isPause{
                cell.taskTimer.pauseTimer()
            }
            
            i += 1
        }
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
