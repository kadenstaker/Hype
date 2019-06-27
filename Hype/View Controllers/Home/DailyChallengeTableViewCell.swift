//
//  ChallengeTableViewCell.swift
//  Hype
//
//  Created by Kaden Staker on 4/29/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class DailyChallengeTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var challengeLabel: UILabel!
    @IBOutlet weak var challengeCompleteButton: UIButton!
    @IBOutlet weak var challengeProgressView: UIProgressView!
    @IBOutlet weak var challengeSkipButton: UIButton!
    
    // MARK: - Properties
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews()
    }
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    var landingPad: MockData? {
//        didSet {
//            updateViews()
//        }
//    }
    
    func updateViews() {
        setUpChallengeCompleteButton()
        setUpProgressView()
    }
    
    func setUpChallengeCompleteButton() {
        guard let button = challengeCompleteButton else { return }
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6532471776, blue: 0.4756888151, alpha: 1)
        button.setTitle("Tap to Fill", for: .normal)
    }
    
    func setUpProgressView() {
        guard let progressView = challengeProgressView else { return }
        progressView.progressTintColor = #colorLiteral(red: 0.186888814, green: 0.6908265948, blue: 0.9980760217, alpha: 1)
        progressView.trackTintColor = #colorLiteral(red: 0.9270117879, green: 0.9414884448, blue: 0.9499133229, alpha: 1)
        
        progressView.progress = 0.5
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
    }
    
}
