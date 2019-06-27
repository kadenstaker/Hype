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
    
    var firstName: String
    var lastName: String
    var score: Int
    var currentWeeklyChallenge: [Challenge]
    var currentDailyChallenges: [Challenge]
    var energy: [TrackableHabit]
    var water: [TrackableHabit]
    var transportation: [TrackableHabit]
    var savedArticles: [Article]?
    var profilePic: UIImage?
    var recordID: CKRecord.ID
    var appleUserReference: CKRecord.Reference
    
    init(firstName: String, lastName: String, score: Int = 0, currentWeeklyChallenge: [Challenge], currentDailyChallenge: [Challenge], transportation: [TrackableHabit], savedArticles: [Article]?, energy: [TrackableHabit], water: [TrackableHabit], profilePic: UIImage?, recordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString), appleUserReference: CKRecord.Reference) {
        self.firstName = firstName
        self.lastName = lastName
        self.score = score
        self.currentWeeklyChallenge = currentWeeklyChallenge
        self.currentDailyChallenges = currentDailyChallenge
        self.transportation = transportation
        self.savedArticles = savedArticles
        self.energy = energy
        self.water = water
        self.profilePic = profilePic
        self.recordID = recordID
        self.appleUserReference = appleUserReference
    }
    
    convenience init?(ckRecord: CKRecord) {
        guard let firstName = ckRecord[UserConstants.firstNameKey] as? String,
        let lastName = ckRecord[UserConstants.lastNameKey] as? String,
        let score = ckRecord[UserConstants.scoreKey] as? Int,
        let currentWeeklyChallenge = ckRecord[UserConstants.weeklyChallengeKey] as? [Challenge],
        let currentDailyChallenge = ckRecord[UserConstants.dailyChallengeKey] as? [Challenge],
        let energy = ckRecord[UserConstants.energyKey] as? [TrackableHabit],
        let water = ckRecord[UserConstants.waterKey] as? [TrackableHabit],
        let transportation = ckRecord[UserConstants.transportationKey] as? [TrackableHabit],
        let savedArticles = ckRecord[UserConstants.savedArticlesKey] as? [Article],
        let profilePic = ckRecord[UserConstants.profilePicKey]as? UIImage,
        let applueUserRef = ckRecord[UserConstants.appleUserRefKey] as? CKRecord.Reference else { return nil }
        
        self.init(firstName: firstName, lastName: lastName, score: score, currentWeeklyChallenge: currentWeeklyChallenge, currentDailyChallenge: currentDailyChallenge, transportation: transportation, savedArticles: savedArticles, energy: energy, water: water, profilePic: profilePic, recordID: ckRecord.recordID, appleUserReference: applueUserRef)
        
    }
}

extension CKRecord {
    convenience init(user: User) {
        self.init(recordType: UserConstants.recordType, recordID: user.recordID)
        self.setValue(user.firstName, forKey: UserConstants.firstNameKey)
        self.setValue(user.lastName, forKey: UserConstants.lastNameKey)
        self.setValue(user.score, forKey: UserConstants.scoreKey)
        self.setValue(user.currentWeeklyChallenge, forKey: UserConstants.weeklyChallengeKey)
        self.setValue(user.currentWeeklyChallenge, forKey: UserConstants.dailyChallengeKey)
        self.setValue(user.energy, forKey: UserConstants.energyKey)
        self.setValue(user.water, forKey: UserConstants.waterKey)
        self.setValue(user.transportation, forKey: UserConstants.transportationKey)
        self.setValue(user.savedArticles, forKey: UserConstants.savedArticlesKey)
        self.setValue(user.profilePic, forKey: UserConstants.profilePicKey)
        self.setValue(user.appleUserReference, forKey: UserConstants.appleUserRefKey)
    }
}

struct UserConstants {
    static let recordType = "User"
    static let firstNameKey = "firstName"
    static let lastNameKey = "lastName"
    static let scoreKey = "score"
    static let weeklyChallengeKey = "weekly"
    static let dailyChallengeKey = "daily"
    static let energyKey = "energy"
    static let waterKey = "water"
    static let transportationKey = "transportation"
    static let savedArticlesKey = "savedArticles"
    static let profilePicKey = "profilePic"
    static let appleUserRefKey = "appleUserRefenece"
}
