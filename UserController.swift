//
//  UserController.swift
//  Hype
//
//  Created by Hannah Hoff on 4/25/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class UserController {
    
    // shared instance
    static let shared = UserController()
    
    // sources of truths
    var users: [User] = []
    
    var currentUser: [User] = []
    var dailyChallenges: User?
    var weeklyChallenges: User?
    var habits: User?
    
    //CRUD Functions
    func createUser(firstName: String, lastName: String, email: String, password: String, profilePic: UIImage, score: Int, currentWeeklyChallenge: [Challenge], currentlyDailyChallenge: [Challenge], energy: [TrackableHabit], water: [TrackableHabit], tipsOn: Bool) {
        let _ = User(firstName: firstName, lastName: lastName, email: email, password: password, currentWeeklyChallenge: currentWeeklyChallenge, currentDailyChallenge: currentlyDailyChallenge, energy: energy, water: water, profilePic: profilePic)
        saveToPersistentStore()
        
    }
    
    func updateUser(user: User, firstName: String, lastName: String, email: String, password: String, profilePic: UIImage, score: Int, currentWeeklyChallenge: [Challenge], currentDailyChallenge: [Challenge], energy: [TrackableHabit], water: [TrackableHabit]) {
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.password = password
        user.profilePic = profilePic
        user.score = score
        user.currentWeeklyChallenge = currentWeeklyChallenge
        user.currentDailyChallenge = currentDailyChallenge
        user.energy = energy
        user.water = water
        
        saveToPersistentStore()
    }
    
    // Persistent Store
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documenDirectory = paths[0]
        let userLocation = "user.json"
        let fullURL = documenDirectory.appendingPathComponent(userLocation)
        return fullURL
    }

    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let userAsData = try encoder.encode(users)
            try userAsData.write(to: fileURL())
        } catch let error {
            print("Error saving to persistent store: \(error); \(error.localizedDescription)")
        }
    }

    func loadFromPersistentStore() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedUsers = try decoder.decode([User].self, from: data)
            self.users = decodedUsers
        } catch let error {
            print("There was an error loading from the persistent store: \(error); \(error.localizedDescription)")
        }
    }
}
