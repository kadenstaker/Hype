//
//  Article.swift
//  Hype
//
//  Created by Hannah Hoff on 4/24/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class Article {
    var title: String
    var author: String?
    var publishedAt: String?
    var urlToImage: String
//    var saved: Bool
    var description: String
    
    init(title: String, author: String?, publishedAt: String?, urlToImage: String, /*saved: Bool,*/ description: String) {
        self.title = title
        self.author = author
        self.publishedAt = publishedAt
        self.urlToImage = urlToImage
//        self.saved = saved
        self.description = description
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case publishedAt
//        case saved
        case description
        case urlToImage
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        author = try values.decode(String.self, forKey: .author)
        publishedAt = try values.decode(String.self, forKey: .publishedAt)
//        saved = try values.decode(Bool.self, forKey: .saved)
        description = try values.decode(String.self, forKey: .description)
        urlToImage = try values.decode(String.self, forKey: .urlToImage)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encode(title.self, forKey: .title)
        try values.encode(author.self, forKey: .author)
        try values.encode(publishedAt.self, forKey: .publishedAt)
//        try values.encode(saved.self, forKey: .saved)
        try values.encode(description.self, forKey: .description)
        try values.encode(urlToImage.self, forKey: .urlToImage)
    }
}

extension Article: Equatable, Codable {
    static func == (lhs: Article, rhs: Article) -> Bool {
    return lhs.title == rhs.title &&
        lhs.author == rhs.author &&
        lhs.publishedAt == rhs.publishedAt &&
        lhs.urlToImage == rhs.urlToImage &&
//        lhs.saved == rhs.saved &&
        lhs.description == rhs.description
    }
}

struct topLevelDict: Codable {
    let articles: [Article]
}


