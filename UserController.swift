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
    
    
//    var currentUser: [User] = []
    var currentUser: User?
    
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
    func createUserWith(firstName: String, lastName: String, email: String, password: String, profilePic: UIImage?, currentDailyChallenge: [Challenge], currentWeeklyChallenge: [Challenge], transportation: [TrackableHabit], savedArticles: [Article]?, energy: [TrackableHabit], water: [TrackableHabit], score: Int, completion: @escaping (Bool) -> Void) {
        
        CKContainer.default().fetchUserRecordID { (recordID, error) in
            if let error = error {
                print("💩 There was an error in \(#function) ; \(error) ; \(error.localizedDescription) 💩")
                completion(false)
                return
            }
            
            guard let recordID = recordID else { completion(false); return }
            let appleUserRef = CKRecord.Reference(recordID: recordID, action: .deleteSelf)
            let user = User(firstName: firstName, lastName: lastName, currentWeeklyChallenge: currentWeeklyChallenge, currentDailyChallenge: currentDailyChallenge, transportation: transportation, savedArticles: savedArticles, energy: energy, water: water, profilePic: profilePic, appleUserReference: appleUserRef)
            let userRecord = CKRecord(user: user)
            CKContainer.default().publicCloudDatabase.save(userRecord, completionHandler: { (record, error) in
                if let error = error {
                    print("💩 There was an error in \(#function) ; \(error) ; \(error.localizedDescription) 💩")
                    completion(false)
                    return
                }
                
                guard let record = record,
                    let user = User(ckRecord: record) else { completion(false); return }
                self.currentUser = user
            })
        }
        
//        guard let profilePic = profilePic else { return }
//        let user = User(firstName: firstName, lastName: lastName, currentWeeklyChallenge: currentWeeklyChallenge, currentDailyChallenge: currentDailyChallenge, transportation: transportation, savedArticles: savedArticles, energy: energy, water: water, profilePic: profilePic)
//        save(user: user, completion: completion)
    }
    
    
    func fetchCurrentUser(completion: @escaping (Bool) -> ()) {
        CKContainer.default().fetchUserRecordID { (recordID, error) in
            if let error = error {
                print("💩 There was an error in \(#function) ; \(error) ; \(error.localizedDescription) 💩")
                completion(false)
                return
            }
            
            guard let appleUserRecordID = recordID else { completion(false); return }
            let appleUserReference = CKRecord.Reference(recordID: appleUserRecordID, action: .deleteSelf)
            
            let predicate = NSPredicate(format: "%K == %@", UserConstants.appleUserRefKey, appleUserReference)
            let query = CKQuery(recordType: UserConstants.recordType, predicate: predicate)
            
            CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
                if let error = error {
                    print("💩 There was an error in \(#function) ; \(error) ; \(error.localizedDescription) 💩")
                    completion(false)
                    return
                }
                
                guard let record = records?.first else { completion(false); return }
                let user = User(ckRecord: record)
                self.currentUser = user
                completion(true)
            })
        }
    }
}
