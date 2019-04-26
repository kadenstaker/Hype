//
//  Habit.swift
//  Hype
//
//  Created by Hannah Hoff on 4/24/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class Impact {
    
    var title: String
    var impactImage: UIImage?
    
    init(title: String, impactImage: UIImage?) {
        self.title = title
        self.impactImage = impactImage
    }
    
    enum CodingKeys: String, CodingKey {
        case title
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encode(title.self, forKey: .title)
    }
}

extension Impact: Equatable, Codable {
    static func == (lhs: Impact, rhs: Impact) -> Bool {
       return lhs.title == rhs.title &&
        lhs.impactImage == rhs.impactImage
    }
}

