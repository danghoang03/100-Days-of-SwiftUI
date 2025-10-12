//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Hoàng Minh Hải Đăng on 11/10/25.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
