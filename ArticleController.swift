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
    static let baseUrl = URL(string: "https://newsapi.org/v2/")
    
    //CRUD Functions
    static func fetchArticle(by searchTerm: String, completion: @escaping ([Article]) -> Void) {
        guard let url = baseUrl else { return }
        url.appendingPathComponent("/everything")
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItem = URLQueryItem(name: "query", value: "eco")
        let apiQueryItem = URLQueryItem(name: "apiKey", value: "81be08fbc0a144d9864a612fb2483f01")
        components?.queryItems = [queryItem, apiQueryItem]
        
        guard let componentsUrl = components?.url else { completion([]); return }
        let request = URLRequest(url: componentsUrl)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error fetching data for article \(#function) ; \(error) ; \(error.localizedDescription)")
            }
            
            guard let data = data else { return }
            do {
                let article = try JSONDecoder().decode(Article.self, from: data)
                completion([article])
            } catch {
                print("Error decoding movie items data \(#function) ; \(error) ; \(error.localizedDescription)")
                completion([])
            }
        }
        dataTask.resume()
    }
    
    func fetchImageFor(urlString: String, completion: @escaping((UIImage?) -> Void)) {
        guard let url = URL(string: urlString) else { completion(nil); return }
        print(url.absoluteString)
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("💩 There was an error in \(#function) ; \(error) ; \(error.localizedDescription) 💩")
                completion(nil)
                return
            }
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
    //toggles saved/heart button
    func toggleSavedFor(article: Article) {
        article.saved = !article.saved
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
