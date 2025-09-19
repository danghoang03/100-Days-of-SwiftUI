//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Hoàng Minh Hải Đăng on 19/09/25.
//

import SwiftUI

struct customModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.blue)
    }
}

extension View {
    func customViewModifier() -> some View {
        modifier(customModifier())
    }
}

struct ContentView: View {
    @State private var useRedText = false
    var body: some View {
        Text("Custom ViewModifier")
            .customViewModifier()
    }
}

#Preview {
    ContentView()
}
