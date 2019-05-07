//
//  WeeklyChallengeTableViewCell.swift
//  Hype
//
//  Created by Kaden Staker on 5/7/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class WeeklyChallengeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var challengeNameLabel: UILabel!
    @IBOutlet weak var challengeTimer: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews()
    }

    @IBAction func completeButtonTapped(_ sender: Any) {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
    
    func updateViews() {
        setUpChallengeCompleteButton()
    }
    
    func setUpChallengeCompleteButton() {
        guard let button = completeButton else { return }
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6532471776, blue: 0.4756888151, alpha: 1)
        button.setTitle("Tap to Fill", for: .normal)
    }
    
    

}
