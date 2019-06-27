//
//  NewsTableViewCell.swift
//  Hype
//
//  Created by Hannah Hoff on 5/2/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
        var landingPad: Article? {
            didSet {
                updateViews()
                initButton()
            }
        }

    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var newsPicView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    func fetchImageViewFor(article: Article) {
        guard let urlToImage = article.urlToImage else { return }
        ArticleController.shared.fetchImageFor(urlString: urlToImage, completion: { (newsImage) in
            DispatchQueue.main.async {
                self.newsPicView.image = newsImage
            }
        })
    }
    
    func updateViews() {
        guard let unwrapped = landingPad else { return }
        newsTitleLabel.text = unwrapped.title
        authorLabel.text = "Author: \(unwrapped.author ?? "")"
        dateLabel.text = "\(unwrapped.publishedAt?.dropLast(10) ?? "")"
        
        backView.createShadow(with: .white, width: 4, height: 4, redValue: 0, greenValue: 0, blueValue: 0, alphaValue: 0.5, opacity: 4, radius: 4)
        newsPicView.layer.cornerRadius = 8
    }
}

extension NewsTableViewCell {
    
    func initButton() {
        saveButton.addTarget(self, action: #selector(NewsTableViewCell.buttonPressed), for: .touchUpInside)
}
    
    @objc func buttonPressed() {
        guard let landingPad = landingPad else { return }
        activateButton(bool: !landingPad.isSaved)
    }
    
    func activateButton(bool: Bool) {
        landingPad?.isSaved = bool
        
        let image = bool ? UIImage(named: "redHeart") : UIImage(named: "emptyHeart")
        
        saveButton.setImage(image, for: .normal)
    }
    
}
