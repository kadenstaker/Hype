//
//  NewsTableViewCell.swift
//  Hype
//
//  Created by Hannah Hoff on 5/1/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var landingPad: Article? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var articlePic: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func fetchImageViewFor(article: Article) {
        ArticleController.shared.fetchImageFor(urlString: article.urlToImage) { (articleImage) in
            DispatchQueue.main.async {
                self.articlePic.image = articleImage
            }
        }
    }
    
    func updateViews() {
        guard let unwrappedItem = landingPad else { return }
        articleTitle.text = unwrappedItem.title
        authorLabel.text = unwrappedItem.author
        dateLabel.text = unwrappedItem.publishedAt
    }

}
