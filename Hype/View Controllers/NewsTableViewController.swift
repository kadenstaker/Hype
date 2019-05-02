//
//  NewsTableViewController.swift
//  Hype
//
//  Created by Kaden Staker on 4/29/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var savedArticlesButton: UIButton!
    
    var articles: [Article] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.tableView.rowHeight = 200
    }
    
    @IBAction func savedArticlesButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as?  NewsTableViewCell
        
        let article = articles[indexPath.row]
        cell?.landingPad = article
        
//        ArticleController.shared.fetchImageFor(urlString: article) { (image) in
//            DispatchQueue.main.async {
//                cell?.articlePic.image = image
//            }
//        }
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
//    func fetchImageViewFor(article: Article) {
//        ArticleController.shared.fetchImageFor(urlString: article.urlToImage) { (articleImage) in
//            DispatchQueue.main.async {
//                self.articlePic.image = articleImage
//            }
//        }
//    }

}

extension NewsTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        ArticleController.shared.fetchArticleWith(searchTerm: searchTerm) { (articles) in
            self.articles = articles
        }
    }
}
