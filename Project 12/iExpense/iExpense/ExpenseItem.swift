//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Hoàng Minh Hải Đăng on 14/10/25.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    var id = UUID()
    var name: String
    var type: String
    var amount: Int
    
    init(name: String, type: String, amount: Int) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}

