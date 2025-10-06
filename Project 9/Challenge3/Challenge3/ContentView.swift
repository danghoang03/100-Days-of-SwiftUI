//
//  ContentView.swift
//  MoonShot
//
//  Created by Hoàng Minh Hải Đăng on 06/10/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isGridMode = true
    
    var body: some View {
        NavigationStack {
            Group {
                if isGridMode {
                    GridModeView(missions: missions, astronauts: astronauts)
                } else {
                    ListModeView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("View Mode", selection: $isGridMode) {
                            Text("View as grid").tag(true)
                            Text("View as list").tag(false)
                        }
                    } label: {
                        HStack {
                            Image(systemName: isGridMode ? "square.grid.2x2" : "list.bullet")
                            Image(systemName: "chevron.up.chevron.down")
                        }
                    }
                }
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
