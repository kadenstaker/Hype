//
//  Challenge.swift
//  Hype
//
//  Created by Hannah Hoff on 4/24/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class Challenge {
    var name: String
    var points: Int
    var isDaily: Bool //bool?
    var isWeekly: Bool
    var dateAssigned: Date
    var rules: String?
    var timesCompleted: Int
    var maxCompletions: Int
    var challengeImage: UIImage?
    
    init(name: String, points: Int, isDaily: Bool, isWeekly: Bool, dateAssigned: Date = Date(), rules: String?, timesCompleted: Int, maxCompletions: Int, challengeImage: UIImage?) {
        self.name = name
        self.points = points
        self.isDaily = isDaily
        self.isWeekly = isWeekly
        self.dateAssigned = dateAssigned
        self.rules = rules
        self.timesCompleted = timesCompleted
        self.maxCompletions = maxCompletions
        self.challengeImage = challengeImage
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case points
        case isDaily
        case isWeekly
        case dateAssigned
        case rules
        case timesCompleted
        case maxCompletions
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        points = try values.decode(Int.self, forKey: .points)
        isDaily = try values.decode(Bool.self, forKey: .isDaily)
        isWeekly = try values.decode(Bool.self, forKey: .isWeekly)
        dateAssigned = try values.decode(Date.self, forKey: .dateAssigned)
        rules = try values.decode(String.self, forKey: .rules)
        timesCompleted = try values.decode(Int.self, forKey: .timesCompleted)
        maxCompletions = try values.decode(Int.self, forKey: .maxCompletions)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encode(name.self, forKey: .name)
        try values.encode(points.self, forKey: .points)
        try values.encode(isDaily.self, forKey: .isDaily)
        try values.encode(isWeekly.self, forKey: .isWeekly)
        try values.encode(dateAssigned.self, forKey: .dateAssigned)
        try values.encode(rules.self, forKey: .rules)
        try values.encode(timesCompleted.self, forKey: .timesCompleted)
        try values.encode(maxCompletions.self, forKey: .maxCompletions)
    }
}

extension Challenge: Equatable, Codable {
    static func == (lhs: Challenge, rhs: Challenge) -> Bool {
        return lhs.name == rhs.name &&
        lhs.points == rhs.points &&
        lhs.isDaily == rhs.isDaily &&
        lhs.isWeekly == rhs.isWeekly &&
        lhs.dateAssigned == rhs.dateAssigned &&
        lhs.rules == rhs.rules &&
        lhs.timesCompleted == rhs.timesCompleted &&
        lhs.maxCompletions == rhs.maxCompletions
    }
}

