//
//  AddView.swift
//  iExpense
//
//  Created by Hoàng Minh Hải Đăng on 30/09/25.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Business"
    @State private var amount: Int? = nil
    @FocusState private var amountIsFocused: Bool
    private var currencySymbol: String {
        return Locale.current.currencySymbol ?? "$"
    }
    var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Expense Name") {
                    TextField("Name", text: $name)
                }
                
                Section("Type") {
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Amount"){
                    HStack {
                        Text(currencySymbol)
                            .foregroundColor(.gray)
                            .bold()
                        TextField("0", value: $amount, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                }
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    if name != "" {
                        if let amount = amount {
                            let item = ExpenseItem(name: name, type: type, amount: amount)
                            expenses.items.append(item)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
