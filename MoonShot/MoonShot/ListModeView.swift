//
//  ListModeView.swift
//  MoonShot
//
//  Created by Hoàng Minh Hải Đăng on 05/10/25.
//

import SwiftUI

struct ListModeView: View {
    let missions: [Mission]
    
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 60)
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return ListModeView(missions: missions, astronauts: astronauts)
        .preferredColorScheme(.dark)
}
