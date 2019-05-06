//
//  ChallengeDetailTableViewCell.swift
//  Hype
//
//  Created by Hannah Hoff on 5/6/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class ChallengeDetailTableViewCell: UITableViewCell {
    
    var arrayOfSteps = ChallengeStepsController.shared.steps

    @IBOutlet weak var instructionsLabel: UILabel!
        
override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
}
    
    func updateViews(challengeSteps: ChallengeSteps) {
        instructionsLabel.text = challengeSteps.body
    }
}
