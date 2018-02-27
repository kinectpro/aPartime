//
//  TaskCell.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var playTappedHandler: () -> Void = {}
    var stopTappedHandler: () -> Void = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackgroundView.layer.cornerRadius = 5.0
        cellBackgroundView.layer.borderWidth = 1.0
        cellBackgroundView.layer.borderColor = UIColor.lightGray.cgColor
        cellBackgroundView.layer.shadowColor = UIColor.darkGray.cgColor
        cellBackgroundView.layer.shadowOpacity = 0.3
        cellBackgroundView.layer.shadowOffset = CGSize.zero
        cellBackgroundView.layer.shadowRadius = 2
    }
    

    @IBAction func playTapped(_ sender: UIButton) {
        playTappedHandler()
    }
    
    @IBAction func stopTapped(_ sender: UIButton) {
        stopTappedHandler()
    }
}
