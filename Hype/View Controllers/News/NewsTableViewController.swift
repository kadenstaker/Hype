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
    @IBOutlet weak var savedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        ArticleController.shared.fetchArticleWith(searchTerm: "") { (articles) in
            ArticleController.shared.article = articles
//            self.articles = articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
<<<<<<< HEAD
    func savedArticles(articles: [Article]) {
        var articles = articles
        for article in articles {
            if article.isSaved == true {
                articles.append(article)
            }
        }
=======
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.tableView.rowHeight = 200
    }
    
    @IBAction func savedArticlesButtonTapped(_ sender: Any) {
        
>>>>>>> 9923bd57a374f539ba21688a9a32996c79ac7cac
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArticleController.shared.article.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? NewsTableViewCell
        
        let article = ArticleController.shared.article[indexPath.row]
        cell?.landingPad = article
<<<<<<< HEAD
        guard let urlToImage = article.urlToImage else { return UITableViewCell() }
        ArticleController.shared.fetchImageFor(urlString: urlToImage) { (newsImage) in
            DispatchQueue.main.async {
                cell?.newsPicView.image = newsImage
            }
        }
=======
        
        
//        ArticleController.shared.fetchImageFor(urlString: article) { (image) in
//            DispatchQueue.main.async {
//                cell?.articlePic.image = image
//            }
//        }
        
>>>>>>> 9923bd57a374f539ba21688a9a32996c79ac7cac
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

extension NewsTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
<<<<<<< HEAD
        ArticleController.shared.fetchArticleWith(searchTerm: "") { (articles) in
            ArticleController.shared.article = articles
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
=======
        ArticleController.shared.fetchArticleWith(searchTerm: searchTerm) { (articles) in
//            guard let article = articles else { print("No dice!"); return }
            self.articles = articles
            
>>>>>>> 9923bd57a374f539ba21688a9a32996c79ac7cac
        }
    }
}

extension NewsTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
}
