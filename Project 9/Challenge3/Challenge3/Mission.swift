//
//  Mission.swift
//  MoonShot
//
//  Created by Hoàng Minh Hải Đăng on 03/10/25.
//

import Foundation

struct Crew: Codable, Hashable {
    let name: String
    let role: String
}

struct Mission: Codable, Identifiable, Hashable {
    let id: Int
    let launchDate: Date?
    let crew: [Crew]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "NA"
    }
}
