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
    var data = [Task]()
    
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
        //TODO: move cell prepare to presenter !!!!!!!!!!!!
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TaskCell
        let task = data[indexPath.row]
        let name = task.name!
        cell.taskTimer = TaskTimer()
        let spentTime = task.spentTime!//self.tasksPresenter.getSpentTime(taskName: name, featureName: self.feature)
        cell.spentTime = spentTime
        cell.timeLabel.text = tasksPresenter.stringFromTimeInterval(interval: spentTime) as String
        cell.nameLabel.text = name
        
        cell.startTappedHandler = {
            
            self.pauseAllTasks()
            if cell.isPause {
                cell.startPauseButton.setImage(#imageLiteral(resourceName: "PauseIcon"), for: .normal)
                self.tasksPresenter.saveStartTime(taskName: name, featureName: self.feature)
                cell.taskTimer.startTimer()
                self.tasksPresenter.saveSpentTime(taskName: name, featureName: self.feature, spentTime: cell.spentTime, isPause: false)
            }else{
                //cell.isPause = !cell.isPause
                cell.taskTimer.pauseTimer()
                self.tasksPresenter.saveSpentTime(taskName: name, featureName: self.feature, spentTime: cell.spentTime, isPause: true)
            }
            //cell.isPause = !cell.isPause
        }
        cell.taskTimer.timerHandler = {
            cell.trackingTime()
        }

        cell.stopTappedHandler = {
            self.pauseAllTasks()
            self.tasksPresenter.finishedTask(viewController: self, nameTask: name, spentTime: cell.spentTime)
            
        }
        
        return cell
    }
    
    func pauseAllTasks() {
        var i = 0
        for _ in data {
            let cell = tableView.cellForRow(at: IndexPath(item: i, section: 0)) as! TaskCell
            //cell.isPause = !cell.isPause
            cell.startPauseButton.setImage(#imageLiteral(resourceName: "PlayIcon"), for: .normal)
            if cell.isPause{
                cell.taskTimer.pauseTimer()
                self.tasksPresenter.saveSpentTime(taskName: cell.nameLabel.text!, featureName: self.feature, spentTime: cell.spentTime, isPause: true)
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
