//
//  TaskCell.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

//class TaskCell: UITableViewCell {
//
//    @IBOutlet weak var cellBackgroundView: UIView!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var editButton: UIButton!
//
//    @IBOutlet weak var topConstraint: NSLayoutConstraint!
//    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
//
//    var editTappedHandler: ()->Void = {}
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        cellBackgroundView.layer.cornerRadius = 5.0
//        cellBackgroundView.layer.borderWidth = 1.0
//        cellBackgroundView.layer.borderColor = UIColor.lightGray.cgColor
//        cellBackgroundView.layer.shadowColor = UIColor.black.cgColor
//        cellBackgroundView.layer.shadowOpacity = 0.3
//        cellBackgroundView.layer.shadowOffset = CGSize.zero
//        cellBackgroundView.layer.shadowRadius = 2
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//    @IBAction func editTapped(_ sender: UIButton) {
//        editTappedHandler()
//    }
//}

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startPauseButton: UIButton!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var startTappedHandler: () -> Void = {}
    var stopTappedHandler: () -> Void = {}
    var startDate: Date!
    var stopDate: Date!
    var spentTime: Double = 0.0
    var taskTimer: TaskTimer!
    
    @IBAction func startPauseTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        startTappedHandler()
    }
    
    @IBAction func stopTapped(_ sender: UIButton) {
        stopTappedHandler()
    }
    
    func trackingTime() {
        if startDate == nil {
            startDate = Date()
        }
        spentTime += 1
        timeLabel.text = stringFromTimeInterval(interval: spentTime) as String
    }
    
    func stringFromTimeInterval(interval: Double) -> NSString {
        let hours = (Int(interval) / 3600)
        let minutes = Int(interval / 60) - Int(hours * 60)
        let seconds = Int(interval) - (Int(interval / 60) * 60)
        return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
    
}

