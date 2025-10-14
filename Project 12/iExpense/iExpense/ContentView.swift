//
//  ContentView.swift
//  iExpense
//
//  Created by Hoàng Minh Hải Đăng on 14/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingAddView = false
    @State private var selectedType = "All"
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]

    var body: some View {
        NavigationStack {
            ExpensesView(expenseType: selectedType, sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu(selectedType == "All" ? "Filter" : selectedType, systemImage: "line.3.horizontal.decrease.circle") {
                        Picker(selectedType, selection: $selectedType) {
                            Text("Show All").tag("All")
                            Text("Personal").tag("Personal")
                            Text("Business").tag("Business")
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])

                            Text("Sort by Amount")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddView = true
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddView()
            }
        }
    }
}

#Preview {
    ContentView()
}
