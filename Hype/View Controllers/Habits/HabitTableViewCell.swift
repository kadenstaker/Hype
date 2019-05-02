//
//  HabitTableViewCell.swift
//  Hype
//
//  Created by Kaden Staker on 4/26/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {

    @IBOutlet weak var habitImageView: UIImageView!
    @IBOutlet weak var habitLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func updateMock() {
        habitLabel.text = "Transportation"
        habitLabel.text = "Recycle"
        habitLabel.text = "Energy"
        habitLabel.text = "Water"
    }

}
