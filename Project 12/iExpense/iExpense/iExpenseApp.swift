//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Hoàng Minh Hải Đăng on 30/09/25.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
