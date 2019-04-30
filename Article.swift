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
    var author: String
    var date: Date
    var urlToImage: String?
    var saved: Bool
    var articleBody: String
    
    init(title: String, author: String, date: Date, urlToImage: String?, saved: Bool, articleBody: String) {
        self.title = title
        self.author = author
        self.date = date
        self.urlToImage = urlToImage
        self.saved = saved
        self.articleBody = articleBody
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case date
        case saved
        case articleBody
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        author = try values.decode(String.self, forKey: .author)
        date = try values.decode(Date.self, forKey: .date)
        saved = try values.decode(Bool.self, forKey: .saved)
        articleBody = try values.decode(String.self, forKey: .articleBody)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encode(title.self, forKey: .title)
        try values.encode(author.self, forKey: .author)
        try values.encode(date.self, forKey: .date)
        try values.encode(saved.self, forKey: .saved)
        try values.encode(articleBody.self, forKey: .articleBody)
    }
}

extension Article: Equatable, Codable {
    static func == (lhs: Article, rhs: Article) -> Bool {
    return lhs.title == rhs.title &&
        lhs.author == rhs.author &&
        lhs.date == rhs.date &&
        lhs.urlToImage == rhs.urlToImage &&
        lhs.saved == rhs.saved &&
        lhs.articleBody == rhs.articleBody
    }
}

struct topLevelDict: Codable {
    let results: [Article]
}

