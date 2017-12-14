//
//  TaskFinishedViewController.swift
//  aPartime
//
//  Created by Bobby numdevios on 13.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class TaskFinishedViewController: UIViewController {
    
    @IBOutlet weak var finishedButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var nameTask = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        finishedButton.roundedAndShadowButton()
        nameLabel.text = nameTask
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func finishedTapped(_ sender: UIButton) {
        //TODO: save data to Firestore
        self.dismiss(animated: true, completion: nil)
    }
}
