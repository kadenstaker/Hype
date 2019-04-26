//
//  TrackableHabit.swift
//  Hype
//
//  Created by Hannah Hoff on 4/24/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import Foundation

class TrackableHabit {
    
    var month: Date
    var year: Date
    var usage: String
    var amount: Double
    
    init(month: Date, year: Date, usage: String, amount: Double) {
        self.month = month
        self.year = year
        self.usage = usage
        self.amount = amount
    }
    
    enum CodingKeys: String, CodingKey {
        case month
        case year
        case usage
        case amount
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        month = try values.decode(Date.self, forKey: .month)
        year = try values.decode(Date.self, forKey: .year)
        usage = try values.decode(String.self, forKey: .usage)
        amount = try values.decode(Double.self, forKey: .amount)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encode(month.self, forKey: .month)
        try values.encode(year.self, forKey: .year)
        try values.encode(usage.self, forKey: .usage)
        try values.encode(amount.self, forKey: .amount)
    }
}

extension TrackableHabit: Equatable, Codable {
    static func == (lhs: TrackableHabit, rhs: TrackableHabit) -> Bool {
        return lhs.month == rhs.month &&
        lhs.year == rhs.year &&
        lhs.usage == rhs.usage &&
        lhs.amount == rhs.amount
    }
}

