//
//  TrackableHabit.swift
//  Hype
//
//  Created by Hannah Hoff on 4/24/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import Foundation

class TrackableHabit {
    
    var date: String
    var usage: String
    var amount: String
    
    init(date: String, usage: String, amount: String) {
        self.date = date
        self.usage = usage
        self.amount = amount
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case usage
        case amount
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decode(String.self, forKey: .date)
        usage = try values.decode(String.self, forKey: .usage)
        amount = try values.decode(String.self, forKey: .amount)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encode(date.self, forKey: .date)
        try values.encode(usage.self, forKey: .usage)
        try values.encode(amount.self, forKey: .amount)
    }
}

extension TrackableHabit: Equatable, Codable {
    static func == (lhs: TrackableHabit, rhs: TrackableHabit) -> Bool {
        return lhs.date == rhs.date &&
        lhs.usage == rhs.usage &&
        lhs.amount == rhs.amount
    }
}

