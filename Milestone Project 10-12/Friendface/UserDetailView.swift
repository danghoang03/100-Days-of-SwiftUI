//
//  UserDetailView.swift
//  Friendface
//
//  Created by Hoàng Minh Hải Đăng on 15/10/25.
//

import SwiftUI
import SwiftData

struct UserDetailView: View {
    let user: User
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            VStack {
                Image("avatar")
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.vertical)
                Text(user.name)
                    .font(.system(size: 25).bold())
                Text("created at: \(user.registered.formatted(date: .abbreviated, time: .omitted))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Age: \(user.age)")
                    Text("Company: \(user.company)")
                    Text("Email: \(user.email)")
                    Text("Address: \(user.address)")
                    Text("About: \(user.about)")
                    Text("Friends")
                        .font(.system(size: 25).bold())
                    FriendListView(friends: user.friends ?? [])
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }

            .padding()
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Home", systemImage: "house.fill") {
                    path = NavigationPath()
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: User.self, configurations: config)
    
    let user = User(
        id: UUID(),
        isActive: false,
        name: "Alford Rodriguez",
        age: 21,
        company: "Imkan",
        email: "alfordrodriguez@imkan.com",
        address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
        about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
        registered: Date.now,
        tags:["cillum", "consequat", "deserunt", "nostrud", "eiusmod", "minim", "tempor"],
        friends: [Friend(id: UUID(), name: "Hawkins Patel")]
    )
    return UserDetailView(user: user, path: .constant(NavigationPath()))
        .modelContainer(container)
}
