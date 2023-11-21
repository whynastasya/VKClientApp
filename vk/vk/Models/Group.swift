//
//  Group.swift
//  vk
//
//  Created by nastasya on 29.06.2023.
//

import Foundation

struct GroupsResponse: Decodable {
    var response: Groups
}

struct Groups: Decodable {
    var items: [Group]
}

struct Group: Decodable {
    let name: String
    let avatarURL: String
    let theme: String
    let subcribersCount: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case avatarURL = "photo_50"
        case theme = "activity"
        case subcribersCount = "members_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.avatarURL = try container.decode(String.self, forKey: .avatarURL)
        self.theme = try container.decode(String.self, forKey: .theme)
        self.subcribersCount = try container.decode(Int.self, forKey: .subcribersCount)
        print(name, theme)
    }
}
