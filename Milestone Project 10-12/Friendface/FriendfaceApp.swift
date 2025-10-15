//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Hoàng Minh Hải Đăng on 15/10/25.
//

import SwiftUI
import SwiftData

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
