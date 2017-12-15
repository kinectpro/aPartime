//
//  TaskFinishedViewController.swift
//  aPartime
//
//  Created by Bobby numdevios on 13.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class TaskFinishedViewController: UIViewController {
    
    var tasksPresenter: TaskPresenter!
    
    @IBOutlet weak var finishedButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var nameTask = ""
    var spentTime = "00:00"
    var feature = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tasksPresenter = TaskPresenter()
        finishedButton.roundedAndShadowButton()
        nameLabel.text = nameTask
        timeLabel.text = spentTime
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func finishedTapped(_ sender: UIButton) {
        let description = descriptionTextField.text ?? ""
        self.tasksPresenter.saveStopTime(featureName: feature, taskName: self.nameTask, description: description)
        self.dismiss(animated: true, completion: nil)
    }
}
