//
//  CustomDivider.swift
//  MoonShot
//
//  Created by Hoàng Minh Hải Đăng on 05/10/25.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    Divider()
}
