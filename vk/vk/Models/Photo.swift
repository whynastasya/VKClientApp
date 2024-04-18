//
//  Photo.swift
//  vk
//
//  Created by nastasya on 21.11.2023.
//

import Foundation

struct PhotosResponse: Decodable {
    var response: Photos
}

struct Photos: Decodable {
    var items: [Photo]
}

struct Photo: Decodable {
    var id: Int
    var nameURL: String
    var likesCount: Int
    var isLiked: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case sizes
        case likes
    }
    
    struct Size: Decodable {
        var url: String
    }
    
    enum LikesCodingKeys: String, CodingKey {
        case likesCount = "count"
        case isLiked = "user_likes"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        let sizes = try container.decode([Size].self, forKey: .sizes)
        self.nameURL = sizes[2].url
        let likesContainer = try container.nestedContainer(keyedBy: LikesCodingKeys.self, forKey: .likes)
        self.likesCount = try likesContainer.decode(Int.self, forKey: .likesCount)
        let isLiked = try likesContainer.decode(Int.self, forKey: .isLiked)
        self.isLiked = isLiked == 0 ? false : true
    }
}
