//
//  UserController.swift
//  Hype
//
//  Created by Hannah Hoff on 4/25/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit
import CloudKit

class UserController {
    
    // shared instance
    static let shared = UserController()
    
    // sources of truths
    var users: [User] = []
    
    var currentUser: [User] = []
    var dailyChallenges: User?
    var weeklyChallenges: User?
    var habits: User?
    
    func save(user: User, completion: @escaping (Bool) -> ()) {
        let record = CKRecord(user: user)
        CKContainer.default().privateCloudDatabase.save(record) { (record, error) in
            if let error = error {
                print("💩 There was an error in \(#function) ; \(error) ; \(error.localizedDescription) 💩")
                completion(false)
                return
            }
            
            guard let record = record,
                let user = User(ckRecord: record) else { completion(false); return }
            self.users.append(user)
            completion(true)
        }
    }
    
    //CRUD Functions
    func createUserWith(firstName: String, lastName: String, email: String, password: String, profilePic: UIImage?, currentDailyChallenge: [Challenge], currentWeeklyChallenge: [Challenge], transportation: [TrackableHabit], energy: [TrackableHabit], water: [TrackableHabit], score: Int, completion: @escaping (Bool) -> Void) {
        guard let profilePic = profilePic else { return }
        let user = User(firstName: firstName, lastName: lastName, currentWeeklyChallenge: currentWeeklyChallenge, currentDailyChallenge: currentDailyChallenge, transportation: transportation, energy: energy, water: water, profilePic: profilePic)
        save(user: user, completion: completion)
    }
    
    func fetchUsers(completion: @escaping (Bool) -> ()) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: UserConstants.recordType, predicate: predicate)
        CKContainer.default().privateCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("💩 There was an error in \(#function) ; \(error) ; \(error.localizedDescription) 💩")
                completion(false)
                return
            }
            guard let records = records else { completion(false); return }
            let users = records.compactMap{ User(ckRecord: $0)}
            self.users = users
            completion(true)
        }
    }
    
    // Save
//    guard let userRecord = CKRecord
    
    // Update
    
    // Fetch
    
}
