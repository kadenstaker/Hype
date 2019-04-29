//
//  ArticleTableViewCell.swift
//  Hype
//
//  Created by Hannah Hoff on 4/29/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var authorDateLabel: UILabel!
    // Heart button

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateMock() {
        articleTitleLabel.text = "Solar Energy Saves the Earth?"
        authorDateLabel.text = "Paul Robinson, March 2019"
    }

}
