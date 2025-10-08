//
//  HabitDetailView.swift
//  HabitTracking
//
//  Created by Hoàng Minh Hải Đăng on 07/10/25.
//

import SwiftUI

struct HabitDetailView: View {
    let habit: Habit
    let listOfHabits: Habits
    
    var body: some View {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    Text(habit.description)
                    HStack {
                        if let index = listOfHabits.habits.firstIndex(where: { $0.id == habit.id }) {
                            Text("Completed: \(listOfHabits.habits[index].completionCounter)")
                            
                            Button { listOfHabits.habits[index].completionCounter += 1
                            } label: {
                                Label("Increase completion counter", systemImage: "plus")
                            }
                            .labelStyle(.iconOnly)
                            .buttonStyle(.bordered)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(habit.name)
    }
}

#Preview {
    let habit = Habit(name: "Play game", description: "Desciption", completionCounter: 1)
    let list = Habits()
        list.habits.append(habit)
    return HabitDetailView(habit: habit, listOfHabits: list)
        .preferredColorScheme(.dark)
}
