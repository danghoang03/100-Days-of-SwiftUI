//
//  ContentView.swift
//  Challenge12
//
//  Created by Hoàng Minh Hải Đăng on 06/10/25.
//

import SwiftUI
import Observation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            // SỬA LỖI: Luôn luôn lưu, kể cả khi mảng rỗng
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var selectedType = "Personal"
    let types = ["Personal", "Business"]
    private var currencySymbol: String {
        Locale.current.currency?.identifier ?? "USD"
    }
    private var filteredItems: [ExpenseItem] {
        expenses.items.filter { $0.type == selectedType }
    }

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Selected Expense Type", selection: $selectedType) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                List {
                    if filteredItems.isEmpty {
                        Text("No data")
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    ForEach(filteredItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                            }
                            Spacer()
                        
                            Text(item.amount, format: .currency(code: currencySymbol))
                                .foregroundStyle(
                                    item.amount <= 100_000 ? .green : (item.amount <= 1_000_000 ? .orange : .red)
                                )
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        AddView(expenses: expenses)
                    } label: {
                        Label("Add Expense", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let itemToDelete = filteredItems[index]
            if let indexInExpenses = expenses.items.firstIndex(where: {$0.id == itemToDelete.id}) {
                expenses.items.remove(at: indexInExpenses)
            }
        }

    }
}

#Preview {
    ContentView()
}
