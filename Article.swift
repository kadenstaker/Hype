//
//  Article.swift
//  Hype
//
//  Created by Hannah Hoff on 4/24/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

struct Article: Decodable {
    var title: String
    var author: String?
    var publishedAt: String?
    var url: String
    var description: String
    var urlToImage: String?
    var isSaved = false
    var savedObjects: [Article] = []
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case author = "author"
        case publishedAt = "publishedAt"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
    }
}

struct topLevelDict: Decodable {
    let articles: [Article]
    private enum CodingKeys: String, CodingKey {
        case articles = "articles"
    }
}
