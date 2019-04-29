//
//  ChallengeTableViewCell.swift
//  Hype
//
//  Created by Hannah Hoff on 4/29/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
    
    var landingPad: MockData? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var challengeTitleLabel: UILabel!

    func updateViews() {
//        guard let unwrapped = landingPad else { return }
        challengeTitleLabel.text = "Turn off all the lights when you leave a room"
    }

}
