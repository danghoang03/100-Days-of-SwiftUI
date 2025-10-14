//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Hoàng Minh Hải Đăng on 13/10/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
