//
//  FriendListView.swift
//  Friendface
//
//  Created by Hoàng Minh Hải Đăng on 15/10/25.
//

import SwiftUI
import SwiftData

struct FriendListView: View {
    let friends: [Friend]
    
    var body: some View {
        ForEach(friends) { friend in
            NavigationLink(value: friend) {
                HStack {
                    Image("avatar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(.circle)
                    Text(friend.name)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: User.self, configurations: config)
    let friend = Friend(id: UUID(), name: "Hawkins Patel")
    return FriendListView(friends: [friend])
        .modelContainer(container)
}
