//
//  OnboardingContentViewController.swift
//  Hype
//
//  Created by Kaden Staker on 5/3/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class OnboardingContentViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel! {
        didSet {
            textLabel.numberOfLines = 0
        }
    }
    
    // MARK: - Properties
    var index = 0
    var text = ""
    var imageFile = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = text
        contentImageView.image = UIImage(named: imageFile)
    }
}
