//
//  MockDataController.swift
//  Hype
//
//  Created by Hannah Hoff on 4/26/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class MockDataController {
    
    var mockData: [MockDataController] = []
    
    func createUserWith(firstName: String, lastName: String, email: String, password: String, currentWeeklyChallenge: [Challenge], currentlyDailyChallenge: [Challenge], energy: [TrackableHabit], water: [TrackableHabit], profilePic: UIImage) {
        let newUser = User(firstName: "John", lastName: "Doe", email: "johndoe@gmail.com", password: "Password", currentWeeklyChallenge: currentWeeklyChallenge, currentDailyChallenge: currentlyDailyChallenge, energy: energy, water: water, profilePic: nil)
        print()
        //attach the user to all the different things
    }
    
    func createChallengeWith(name: String, points: Int, isDaily: Bool, isWeekly: Bool, dateAssigned: Date, rules: String, timesCompleted: String, maxCompletions: String, challenegeImage: UIImage) {
        let newDailyChallenge = Challenge(name: "Turn off the lights", points: 1, isDaily: true, isWeekly: false, dateAssigned: dateAssigned, rules: nil, timesCompleted: 2, maxCompletions: 3, challengeImage: nil)
        let newWeeklyChallenge = Challenge(name: "Start a garden", points: 20, isDaily: false, isWeekly: true, dateAssigned: dateAssigned, rules: "Plant a corn or sumthin 🌽", timesCompleted: 1, maxCompletions: 1, challengeImage: nil)
        print(newDailyChallenge, newWeeklyChallenge)
    }
    
    func createArticleWith(title: String, author: String, articleBody: String, date: Date, articleImage: UIImage, saved: Bool) {
        let newArticle = Article(title: "Solar energy saves the earth?", author: "Paul Robinson", date: date, articleImage: nil, saved: true, articleBody: "Berlin has seen many historical events, espcially in the 20th century. It is unlikely to make history this week, though, as the IPCC plan to unveil more advice on how to prevent climate change. They have finally managed to persuade us to accept the obvious global warming, although credit should really go to the enormous storms and other damage with the resultant loss of life from recent disasters...")
        print(newArticle)
    }
    
    func createImpact(name: String, impactImage: UIImage?) {
        let transportation = Impact(title: "Transportation", impactImage: nil)
        let recycle = Impact(title: "Recycle", impactImage: nil)
        let energy = Impact(title: "Energy", impactImage: nil)
        let water = Impact(title: "Water", impactImage: nil)
        print(transportation, recycle, energy, water)
    }
    
    func createTrackableHabits(month: Date, year: Date, amount: String, usage: Double) {
        let energy = TrackableHabit(month: month, year: year, usage: "54kw", amount: 145.00)
        let water = TrackableHabit(month: month, year: year, usage: "54 gal", amount: 145.00)
        let transportation = TrackableHabit(month: month, year: year, usage: "7", amount: 190.0)
        print(energy, water, transportation)
    }
}
