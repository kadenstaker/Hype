//
//  SavedNewsTableViewController.swift
//  Hype
//
//  Created by Hannah Hoff on 5/3/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class SavedNewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ArticleController.shared.fetchArticleWith(searchTerm: "") { (articles) in
            ArticleController.shared.article = articles
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return ArticleController.shared.article.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedArticleCell", for: indexPath) as? SavedNewsTableViewCell

        let article = ArticleController.shared.article[indexPath.row]
        cell?.article = article
        guard let urlToImage = article.urlToImage else { return UITableViewCell() }
        ArticleController.shared.fetchImageFor(urlString: urlToImage) { (newsImage) in
            DispatchQueue.main.async {
                cell?.savedNewsImage.image = newsImage
            }
        }
        return cell ?? UITableViewCell()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as? NewsDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let article = ArticleController.shared.article[indexPath.row]
            
            destinationVC?.article = article
        }
    }

}

extension SavedNewsTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
}
