//
//  ContentView.swift
//  HabitTracking
//
//  Created by Hoàng Minh Hải Đăng on 07/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var listOfHabits = Habits()
    
    var body: some View {
        NavigationStack {
            HabitsListView(listOfHabits: listOfHabits)
        }
    }
}

#Preview {
    ContentView()
}
