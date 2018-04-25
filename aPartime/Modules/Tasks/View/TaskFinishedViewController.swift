//
//  TaskFinishedViewController.swift
//  aPartime
//
//  Created by MyMac on 3/17/18.
//  Copyright © 2018 kinectpro. All rights reserved.
//

import UIKit

class TaskFinishedViewController: UIViewController {

    var presenter: TasksPresenter!
    
    @IBOutlet weak var finishedButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var nameTask = ""
    var spentTime = "00:00"
    var feature = ""
    var task:TaskViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishedButton.layer.cornerRadius = finishedButton.frame.height/2
        if let task = task {
            nameLabel.text = task.name
            timeLabel.text = self.stringFromTimeInterval(interval: task.spentTime) as String
        }
        
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishedTapped(_ sender: UIButton) {
        guard let task = task else {return}
        let description = descriptionTextField.text ?? ""
        task.description = description
        task.status = .finished
        self.presenter.updateTask(task)
        self.dismiss(animated: true, completion: nil)
    }
    
    func stringFromTimeInterval(interval: Double) -> NSString {
        
        let hours = (Int(interval) / 3600)
        let minutes = Int(interval / 60) - Int(hours * 60)
        let seconds = Int(interval) - (Int(interval / 60) * 60)
        
        return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }

}
