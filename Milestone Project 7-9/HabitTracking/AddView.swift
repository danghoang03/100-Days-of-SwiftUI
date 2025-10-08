//
//  AddView.swift
//  HabitTracking
//
//  Created by Hoàng Minh Hải Đăng on 07/10/25.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var description = ""
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    var listOfHabits: Habits
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("Enter habit name", text: $name)
                }
                Section("Description") {
                    TextField("Write description for your habit", text: $description, axis: .vertical)
                            .lineLimit(10...11)
                }
            }
            .navigationTitle("New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if name != "" && description != "" {
                            let habit = Habit(name: name, description: description, completionCounter: 1)
                            listOfHabits.habits.append(habit)
                            dismiss()
                        } else if name == "" {
                            alertTitle = "Missing habit name"
                            alertMessage = "Please enter your habit name!"
                            showAlert = true
                        } else if description == "" {
                            alertTitle = "Missing description"
                            alertMessage = "Please enter description for your habit!"
                            showAlert = true
                        }
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .alert(alertTitle, isPresented: $showAlert) {}
            message: {
                Text(alertMessage)
            }
        }
    }
}

#Preview {
    AddView(listOfHabits: Habits())
        .preferredColorScheme(.dark)
}
