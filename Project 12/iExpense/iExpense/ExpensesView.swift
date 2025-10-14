//
//  ExpensesView.swift
//  iExpense
//
//  Created by Hoàng Minh Hải Đăng on 14/10/25.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    private var currencySymbol: String {
        Locale.current.currency?.identifier ?? "USD"
    }
    
    init(expenseType: String, sortOrder: [SortDescriptor<ExpenseItem>] ) {
        _expenses = Query(filter: #Predicate<ExpenseItem> { item in
            if expenseType == "All" {
                return true
            } else {
                return item.type == expenseType
            }
        }, sort: sortOrder
        )
    }
    
    var body: some View {
        List {
            if expenses.isEmpty {
                Text("No data")
            } else {
                ForEach(expenses) { item in
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
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let item = expenses[index]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ExpensesView(expenseType: "Personal", sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}
