//
//  User.swift
//  Hype
//
//  Created by Hannah Hoff on 4/24/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit
import CloudKit

class User {
    
    let recordTypeKey = "User"
    fileprivate let firstNameKey = "firstName"
    fileprivate let lastNameKey = "lastName"
    fileprivate let scoreKey = "score"
    fileprivate let weeklyChallengeKey = "weekly"
    
    var recordID = CKRecord.ID(recordName: UUID().uuidString)
    var firstName: String
    var lastName: String
    var score: Int
    var currentWeeklyChallenge: [Challenge]
    var currentDailyChallenges: [Challenge]
    var energy: [TrackableHabit]
    var water: [TrackableHabit]
    var transportation: [TrackableHabit]
    var profilePic: UIImage?
    
    init(firstName: String, lastName: String, score: Int = 0, currentWeeklyChallenge: [Challenge], currentDailyChallenge: [Challenge], transportation: [TrackableHabit], energy: [TrackableHabit], water: [TrackableHabit], profilePic: UIImage?) {
        self.firstName = firstName
        self.lastName = lastName
        self.score = score
        self.currentWeeklyChallenge = currentWeeklyChallenge
        self.currentDailyChallenges = currentDailyChallenge
        self.transportation = transportation
        self.energy = energy
        self.water = water
        self.profilePic = profilePic
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case score
        case currentWeeklyChallenge
        case currentDailyChallenge
        case transportation
        case energy
        case water
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        score = try values.decode(Int.self, forKey: .score)
        currentWeeklyChallenge = try values.decode([Challenge].self, forKey: .currentWeeklyChallenge)
        currentDailyChallenges = try values.decode([Challenge].self, forKey: .currentDailyChallenge)
        transportation = try values.decode([TrackableHabit].self, forKey: .transportation)
        energy = try values.decode([TrackableHabit].self, forKey: .energy)
        water = try values.decode([TrackableHabit].self, forKey: .water)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encode(firstName.self, forKey: .firstName)
        try values.encode(lastName.self, forKey: .lastName)
        try values.encode(score.self, forKey: .score)
        try values.encode(currentWeeklyChallenge.self, forKey: .currentWeeklyChallenge)
        try values.encode(currentDailyChallenges.self, forKey: .currentDailyChallenge)
        try values.encode(transportation.self, forKey: .transportation)
        try values.encode(energy.self, forKey: .energy)
        try values.encode(water.self, forKey: .water)
    }
}

extension User: Equatable, Codable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.currentWeeklyChallenge == rhs.currentWeeklyChallenge &&
            lhs.currentDailyChallenges == rhs.currentDailyChallenges &&
            lhs.energy == rhs.energy &&
            lhs.water == rhs.water &&
            lhs.profilePic == rhs.profilePic
    }
}

extension CKRecord {
//    convenience init(_ user: User) {
//        let recordID = post.recordID
//        self.init(recordType: user.recordTypeKey, recordID: recordID)
//        self.setValue()
//    }
}
