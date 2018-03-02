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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
