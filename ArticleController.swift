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
    
    var article: [Article] = []    
    
    //base url
    let baseUrl = URL(string: "https://newsapi.org/v2/everything")
    
    //CRUD Functions
    func fetchArticleWith(searchTerm: String, completion: @escaping ([Article]) -> Void) {
        guard let url = baseUrl else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let queryItem = URLQueryItem(name: "q", value: "recycling")
        let language = URLQueryItem(name: "language", value: "en")
        let sort = URLQueryItem(name: "sortBy", value: "popularity")
        let apiQueryItem = URLQueryItem(name: "apiKey", value: "81be08fbc0a144d9864a612fb2483f01")
        components?.queryItems = [queryItem, language, sort, apiQueryItem]
        
        guard let componentsUrl = components?.url else { completion([]); return }
        let request = URLRequest(url: componentsUrl)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error fetching data for article \(#function) ; \(error) ; \(error.localizedDescription)")
            }
            
            guard let data = data else { completion([]); return }
            
            do {
                let topArray = try JSONDecoder().decode(topLevelDict.self, from: data)
                completion(topArray.articles)
            } catch {
                print("Error decoding article items data \(#function) ; \(error) ; \(error.localizedDescription)")
                completion([])
            }
        }
        dataTask.resume()
    }
    
    func fetchImageFor(urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: urlString) else { completion(nil); return }
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
}
