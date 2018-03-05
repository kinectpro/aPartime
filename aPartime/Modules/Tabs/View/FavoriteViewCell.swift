//
//  FavoriteViewCell.swift
//  aPartime
//
//  Created by Bobby numdevios on 02.03.2018.
//  Copyright © 2018 kinectpro. All rights reserved.
//

import UIKit

class FavoriteViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var spentTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        spentTimeLabel.layer.cornerRadius = spentTimeLabel.frame.height/2
        spentTimeLabel.layer.backgroundColor = UIColor(red: 171/255, green: 255/255, blue: 199/255, alpha: 0.3).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
