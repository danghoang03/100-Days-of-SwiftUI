//
//  Habit.swift
//  HabitTracking
//
//  Created by Hoàng Minh Hải Đăng on 07/10/25.
//

import Foundation
import Observation

struct Habit: Codable, Identifiable, Hashable {
    var id = UUID()
    let name: String
    let description: String
    var completionCounter: Int
}

@Observable
class Habits {
    var habits: [Habit] {
        didSet {
            if let encodedData = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encodedData, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedData = try? JSONDecoder().decode([Habit].self, from: savedData) {
                habits = decodedData
                return
            }
        }
        habits = []
    }
}
