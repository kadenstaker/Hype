//
//  HabitController.swift
//  Hype
//
//  Created by Hannah Hoff on 4/26/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

// need a separate controller for recycle api?

class ImpactController {
    static let shared = ImpactController()
    
    var impacts: [Impact] = []
    
    func createHabit(title: String, impactImage: UIImage) {
        let impact = Impact(title: title, impactImage: impactImage)
        impact.title = "Transportation"
        impact.title = "Recycle"
        impact.title = "Energy"
        impact.title = "Water"
        
        saveToPersistentStore()
    }
    
    // Persistent Store
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let impactLocation = "impact.json"
        let fullURL = documentDirectory.appendingPathComponent(impactLocation)
        return fullURL
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let impactAsData = try encoder.encode(impacts)
            try impactAsData.write(to: fileURL())
        } catch let error {
            print("Error saving to persistent store: \(error); \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedImpacts = try decoder.decode([Impact].self, from: data)
            self.impacts = decodedImpacts
        } catch let error {
            print("There was an error loading from the persistent store: \(error); \(error.localizedDescription)")
        }
    }
}
