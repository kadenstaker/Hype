//
//  ChallengeController.swift
//  Hype
//
//  Created by Hannah Hoff on 4/25/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class ChallengeController {
    
    static let shared = ChallengeController()
    
    var challenges: [Challenge] = []
    
    //landing pad?
    
    
    //CRUD Functions
    func createChallenge(name: String, points: Int, isDaily: Bool, isWeekly: Bool, dateAssigned: Date, rules: String, timesCompleted: Int, maxCompletions: Int, challengeImage: UIImage) {
        let challenge = Challenge(name: name, points: points, isDaily: isDaily, isWeekly: isWeekly, dateAssigned: dateAssigned, rules: rules, timesCompleted: timesCompleted, maxCompletions: maxCompletions, challengeImage: challengeImage)
        self.challenges.append(challenge)
        saveToPersistentStore()
    }
    
    func updateChallenge(challenge: Challenge, name: String, points: Int, isDaily: Bool, isWeekly: Bool, dateAssigned: Date, rules: String, timesCompleted: Int, maxCompletions: Int, challengeImage: UIImage) {
        challenge.name = name
        challenge.points = points
        challenge.isDaily = isDaily
        challenge.isWeekly = isWeekly
        challenge.dateAssigned = dateAssigned
        challenge.rules = rules
        challenge.timesCompleted = timesCompleted
        challenge.maxCompletions = maxCompletions
        challenge.challengeImage = challengeImage
    }
    
    // Persistent Store
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let challengeLocation = "challenge.json"
        let fullURL = documentDirectory.appendingPathComponent(challengeLocation)
        return fullURL
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let challengesAsData = try encoder.encode(challenges)
            try challengesAsData.write(to: fileURL())
        } catch let error {
            print("Error saving to persistent store: \(error); \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedChallenges = try decoder.decode([Challenge].self, from: data)
            self.challenges = decodedChallenges
        } catch let error {
            print("There was an error loading from the persistent store: \(error); \(error.localizedDescription)")
        }
    }
}
