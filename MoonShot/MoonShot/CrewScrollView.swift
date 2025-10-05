//
//  CrewScrollView.swift
//  MoonShot
//
//  Created by Hoàng Minh Hải Đăng on 05/10/25.
//

import SwiftUI

struct CrewScrollView: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { member in
                    NavigationLink {
                        AstronautView(astronaut: member.astronaut)
                    } label: {
                        HStack {
                            Image(member.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.circle)
                                .overlay(
                                    Circle()
                                        .strokeBorder(
                                            member.role == "Commander" ? .yellow : .white, lineWidth:
                                                member.role == "Commander" ? 2 : 1
                                        )
                                )
                                .overlay(alignment: .topTrailing) {
                                    if member.role == "Commander" {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                            .padding(5)
                                            .background(.black.opacity(0.7))
                                            .clipShape(.circle)
                                            .offset(x: -5, y: 5)
                                    }
                                }
                            
                            VStack(alignment: .leading) {
                                Text(member.astronaut.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(member.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let crew = missions[0].crew.map { member in
        if let astronaut = astronauts[member.name] {
            CrewMember(role: member.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }
        
    return CrewScrollView(crew: crew)
}
