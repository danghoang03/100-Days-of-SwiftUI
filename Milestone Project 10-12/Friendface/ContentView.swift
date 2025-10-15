//
//  ContentView.swift
//  Friendface
//
//  Created by Hoàng Minh Hải Đăng on 15/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            UserListView(users: users)
                .navigationTitle("Friendface")
                .navigationDestination(for: User.self) { user in
                    UserDetailView(user: user, path: $path)
                }
                .navigationDestination(for: Friend.self) { friend in
                    if let friendUser = users.first(where: {$0.id == friend.id}) {
                        UserDetailView(user: friendUser, path: $path)
                    }
                }
        }
        .task {
            if users.isEmpty {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedUsers = try decoder.decode([User].self, from: data)
            for user in decodedUsers {
                modelContext.insert(user)
            }
        } catch {
            print("Invalid data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
