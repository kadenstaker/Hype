//
//  ChallengeTableViewCell.swift
//  Hype
//
//  Created by Kaden Staker on 4/29/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
    

    @IBOutlet weak var challengeLabel: UILabel!
    @IBOutlet weak var challengeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
      
    var landingPad: MockData? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
//        guard let unwrapped = landingPad else { return }
        challengeLabel.text = "Turn off all the lights when you leave a room"

    }

}
