//
//  User.swift
//  Hype
//
//  Created by Hannah Hoff on 4/24/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class User {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var score: Int
    var currentWeeklyChallenge: [Challenge]
    var currentDailyChallenge: [Challenge]
    var energy: [TrackableHabit]
    var water: [TrackableHabit]
    var tipsOn: Bool
    var profilePic: UIImage?
    
    init(firstName: String, lastName: String, email: String, password: String, score: Int = 0, currentWeeklyChallenge: [Challenge], currentDailyChallenge: [Challenge], energy: [TrackableHabit], water: [TrackableHabit], tipsOn: Bool = true, profilePic: UIImage?) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.score = score
        self.currentDailyChallenge = currentDailyChallenge
        self.currentWeeklyChallenge = currentWeeklyChallenge
        self.energy = energy
        self.water = water
        self.tipsOn = tipsOn
        self.profilePic = profilePic
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case email
        case password
        case score
        case currentWeeklyChallenge
        case currentDailyChallenge
        case energy
        case water
        case tipsOn
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        email = try values.decode(String.self, forKey: .email)
        password = try values.decode(String.self, forKey: .password)
        score = try values.decode(Int.self, forKey: .score)
        currentWeeklyChallenge = try values.decode([Challenge].self, forKey: .currentWeeklyChallenge)
        currentDailyChallenge = try values.decode([Challenge].self, forKey: .currentDailyChallenge)
        energy = try values.decode([TrackableHabit].self, forKey: .energy)
        water = try values.decode([TrackableHabit].self, forKey: .water)
        tipsOn = try values.decode(Bool.self, forKey: .tipsOn)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encode(firstName.self, forKey: .firstName)
        try values.encode(lastName.self, forKey: .lastName)
        try values.encode(email.self, forKey: .email)
        try values.encode(password.self, forKey: .password)
        try values.encode(score.self, forKey: .score)
        try values.encode(currentWeeklyChallenge.self, forKey: .currentWeeklyChallenge)
        try values.encode(currentDailyChallenge.self, forKey: .currentDailyChallenge)
        try values.encode(energy.self, forKey: .energy)
        try values.encode(water.self, forKey: .water)
        try values.encode(tipsOn.self, forKey: .tipsOn)
    }
}

extension User: Equatable, Codable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.email == rhs.email &&
            lhs.password == rhs.password &&
            lhs.currentWeeklyChallenge == rhs.currentWeeklyChallenge &&
            lhs.currentDailyChallenge == rhs.currentDailyChallenge &&
            lhs.energy == rhs.energy &&
            lhs.water == rhs.water &&
            lhs.tipsOn == rhs.tipsOn &&
            lhs.profilePic == rhs.profilePic
    }
}

