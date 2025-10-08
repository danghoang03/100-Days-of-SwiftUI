//
//  HabitsListView.swift
//  HabitTracking
//
//  Created by Hoàng Minh Hải Đăng on 07/10/25.
//

import SwiftUI

struct HabitsListView: View {
    var listOfHabits: Habits
    @State private var showAddView = false
    
    var body: some View {
        List {
            ForEach(listOfHabits.habits) { habit in
                NavigationLink(value: habit) {
                    VStack(alignment: .leading) {
                        Text(habit.name)
                            .font(.system(size: 25))
                            .foregroundStyle(.white)
                        Text("Completed \(habit.completionCounter) times")
                            .foregroundStyle(.white.opacity(0.5))
                    }
                }
            }
            .onDelete(perform: deleteItem)
        }
        .navigationTitle("Habits Tracking")
        .preferredColorScheme(.dark)
        .navigationDestination(for: Habit.self) { habit in
            HabitDetailView(habit: habit, listOfHabits: listOfHabits)
        }
        .toolbar {
            Button("Add View", systemImage: "plus") {
                showAddView = true
            }
        }
        .sheet(isPresented: $showAddView) {
            AddView(listOfHabits: listOfHabits)
        }
        .listStyle(.plain)
        .padding(.vertical)
    }
    
    func deleteItem(offsets: IndexSet) {
        listOfHabits.habits.remove(atOffsets: offsets)
    }
}

#Preview {
    HabitsListView(listOfHabits: Habits())
}
