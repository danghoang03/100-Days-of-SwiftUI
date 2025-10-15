//
//  UserListView.swift
//  Friendface
//
//  Created by Hoàng Minh Hải Đăng on 15/10/25.
//

import SwiftUI
struct UserListView: View {
    let users: [User]
    
    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                HStack {
                    Text(user.name)
                        .font(.headline)
                    Spacer()
                    Text(user.isActive ? "Online" : "Offline")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Circle()
                        .fill(user.isActive ? .green : .gray)
                        .frame(width: 10, height: 10) 
                }
            }
        }
    }
    
}

#Preview {
    UserListView(users: [User]())
}
