//
//  ChallengeTableViewCell.swift
//  Hype
//
//  Created by Kaden Staker on 4/29/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var challengeLabel: UILabel!
    @IBOutlet weak var challengeButton: UIButton!
    @IBOutlet weak var challengeProgressView: UIProgressView!
    
    // MARK: - Properties
    var isRed = false
    var progressBarTimer: Timer!
    var isRunning = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        if(isRunning) {
        progressBarTimer.invalidate()
        } else {
            challengeProgressView.progress = 0.0
//            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ChallengeTableViewCell.updateProgressView), userInfo: nil, repeats: true)
            
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
      
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
