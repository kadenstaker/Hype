//
//  ArticleController.swift
//  Hype
//
//  Created by Hannah Hoff on 4/25/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

//search bar delegate

class ArticleController {
    
    static let shared = ArticleController()
    
    var articles: [Article] = []
    
    //base url
    
    
    //CRUD Functions
    static func fetchArticle(by searchTerm: String, competion: @escaping ((Article?) -> Void)) {
        
    }
    
    func fetchImageFor(article: Article, completion: @escaping((UIImage?) -> Void)) {
        
    }
    
    // Persistent Store
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let articleLocation = "article.json"
        let fullURL = documentDirectory.appendingPathComponent(articleLocation)
        return fullURL
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let articleAsData = try encoder.encode(articles)
            try articleAsData.write(to: fileURL())
        } catch let error {
            print("Error saving to persistent store: \(error); \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedArticles = try decoder.decode([Article].self, from: data)
            self.articles = decodedArticles
        } catch let error {
            print("There was an error loading from the persistent store: \(error); \(error.localizedDescription)")
        }
    }
}
