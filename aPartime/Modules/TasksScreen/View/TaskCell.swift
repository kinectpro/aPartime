//
//  TaskCell.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startPauseButton: UIButton!
    
    var startTappedHandler: ()->Void = {}
    var stopTappedHandler: ()->Void = {}
    var isPause = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func startPauseTapped(_ sender: UIButton) {
        isPause = !isPause
        
        let imageButton:UIImage = isPause ? #imageLiteral(resourceName: "pause") : #imageLiteral(resourceName: "play")
       
        startPauseButton.setImage(imageButton, for: .normal)
        
        startTappedHandler()
    }
    
    @IBAction func stopTapped(_ sender: UIButton) {
        stopTappedHandler()
    }
}
