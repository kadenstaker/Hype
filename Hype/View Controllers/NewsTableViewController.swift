//
//  NewsTableViewController.swift
//  Hype
//
//  Created by Kaden Staker on 4/29/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var articles: [Article] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let article = ArticleController.shared.articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.author
        
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    func fetchImageViewFor(article: Article) {
        ArticleController.shared.fetchImageFor(urlString: article.urlToImage) { (articleImage) in
            DispatchQueue.main.async {
                //self.articleImageView.image = articleImage
            }
        }
    }
}
