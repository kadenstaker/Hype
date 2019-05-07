//
//  ChallengeCollectionViewCell.swift
//  Hype
//
//  Created by Hannah Hoff on 5/6/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class ChallengeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var challengeImage: UIImageView!
    @IBOutlet weak var challengeNameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    
    @IBAction func acceptButtonTapped(_ sender: Any) {
        
    }
    
    var challenge: Challenge? {
        didSet {
            
        }
    }
}
