//
//  HabitActivities.swift
//  HabitApp
//
//  Created by Alex Sapsford on 24/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import Foundation

class HabitActivities: ObservableObject {
    
    @Published var habits = [HabitActivity]() {
        
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let habits = UserDefaults.standard.data(forKey: "Habits") {
            
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([HabitActivity].self, from: habits) {
                self.habits = decoded
                return
            }
        }
        
        self.habits = []
    }
}
