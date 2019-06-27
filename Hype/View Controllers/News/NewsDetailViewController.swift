//
//  NewsDetailViewController.swift
//  Hype
//
//  Created by Hannah Hoff on 5/3/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var article: Article?
    
    @IBOutlet weak var detailNewsTitleLabel: UILabel!
    @IBOutlet weak var detailNewsPicView: UIImageView!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        guard let article = article else { return }
        fetchDetailImageViewFor(article: article)
        
    }
    
    @IBAction func readArticleButtonTapped(_ sender: Any) {
        guard let article = article else { return }
        UIApplication.shared.open(URL(string: "\(article.url)")! as URL, options: [:], completionHandler: nil)
    }
    
    func openUrl(urlString: String) {
        if let url = URL(string:urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func fetchDetailImageViewFor(article: Article) {
        guard let urlToImage = article.urlToImage else { return }
        ArticleController.shared.fetchImageFor(urlString: urlToImage, completion: { (newsImage) in
            DispatchQueue.main.async {
                self.detailNewsPicView.image = newsImage
            }
        })
    }
    
    fileprivate func updateIsSaved(article: Article) {
        if article.isSaved ?? false {
            saveButton.setImage(UIImage(named: "redHeart"), for: .normal)
        } else {
            saveButton.setImage(UIImage(named: "empyHeart"), for: .normal)
        }
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
}

extension NewsDetailViewController {
    func update() {
        guard let unwrapped = article else { return }
        detailNewsTitleLabel.text = unwrapped.title
        descriptionTextLabel.text = unwrapped.description
        
        backView.createShadow(with: .white, width: 4, height: 4, redValue: 0, greenValue: 0, blueValue: 0, alphaValue: 0.5, opacity: 4, radius: 4)
        detailNewsPicView.layer.cornerRadius = 4
        
        //        if !unwrapped.isSaved ?? false {
        //    saveButton.setImage(UIImage(named: "emptyHeart"), for: .normal)
        //    } else {
        //    updateIsSaved(article: unwrapped)
        //    }
        
        updateIsSaved(article: unwrapped)
    }
}


