//
//  ChallengeDetailTableViewCell.swift
//  Hype
//
//  Created by Hannah Hoff on 5/6/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class ChallengeDetailTableViewCell: UITableViewCell {
    
    var arrayOfSteps: ChallengeSteps? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    
override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
}
    
    func updateViews() {
        guard let unwrapped = arrayOfSteps else { return }
        instructionsLabel.text = unwrapped.body
        headerLabel.text = unwrapped.header
    }
}
