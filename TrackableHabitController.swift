//
//  TrackableHabitController.swift
//  Hype
//
//  Created by Hannah Hoff on 4/26/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import Foundation

class TrackableHabitController {
    static let shared = TrackableHabitController()
    
    var trackableHabits: [TrackableHabit] = []
    
    func createTrackableHabit(date: String, usage: String, amount: String) {
        let trackableHabit = TrackableHabit(date: date, usage: usage, amount: amount)
        self.trackableHabits.append(trackableHabit)
        saveToPersistentStore()
    }
    
    func updateTrackableHabit(trackableHabit: TrackableHabit, date: String, usage: String, amount: String) {
        trackableHabit.date = date
        trackableHabit.usage = usage
        trackableHabit.amount = amount
        saveToPersistentStore()
    }
    
    // Persistent Store
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documenDirectory = paths[0]
        let trackableHabitLocation = "trackableHabit.json"
        let fullURL = documenDirectory.appendingPathComponent(trackableHabitLocation)
        return fullURL
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let trackableHabitAsData = try encoder.encode(trackableHabits)
            try trackableHabitAsData.write(to: fileURL())
        } catch let error {
            print("Error saving to persistent store: \(error); \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedTrackableHabits = try decoder.decode([TrackableHabit].self, from: data)
            self.trackableHabits = decodedTrackableHabits
        } catch let error {
            print("There was an error loading from the persistent store: \(error); \(error.localizedDescription)")
        }
    }
}
