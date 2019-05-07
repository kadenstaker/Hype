//
//  SavedNewsTableViewCell.swift
//  Hype
//
//  Created by Hannah Hoff on 5/3/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class SavedNewsTableViewCell: UITableViewCell {
    
    var article: Article? {
        didSet {
            updateViews()
            initButton()
        }
    }
    
    @IBOutlet weak var savedNewsImage: UIImageView!
    @IBOutlet weak var savedNewsTitleLabel: UILabel!
    @IBOutlet weak var savedAuthorLabel: UILabel!
    @IBOutlet weak var savedNewsDateLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    func fetchImageViewFor(article: Article) {
        guard let urlToImage = article.urlToImage else { return }
        ArticleController.shared.fetchImageFor(urlString: urlToImage, completion: { (newsImage) in
            DispatchQueue.main.async {
                self.savedNewsImage.image = newsImage
            }
        })
    }
    func updateViews() {
        guard let unwrappedItem = article else { return }
        self.savedNewsTitleLabel.text = unwrappedItem.title
        self.savedAuthorLabel.text = "Author: \(unwrappedItem.author ?? "")"
        self.savedNewsDateLabel.text = "\(unwrappedItem.publishedAt?.dropLast(10) ?? "")"
        
        backView.createShadow(with: .white, width: 4, height: 4, redValue: 0, greenValue: 0, blueValue: 0, alphaValue: 0.5, opacity: 4, radius: 4)
        savedNewsImage.layer.cornerRadius = 8
        
    }
}

//func savedArticles(articles: [Article]) {
//    var articles = articles
//    for article in articles {
//        if article.isSaved == true {
//            articles.append(article)
//        }
//    }
//}

extension SavedNewsTableViewCell {
    
    func initButton() {
        saveButton.addTarget(self, action: #selector(SavedNewsTableViewCell.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        guard let landingPad = article else { return }
        activateButton(bool: !landingPad.isSaved)
    }
    
    func activateButton(bool: Bool) {
        article?.isSaved = bool
        
        let image = bool ? UIImage(named: "redHeart") : UIImage(named: "emptyHeart")
        
        saveButton.setImage(image, for: .normal)
    }
}
