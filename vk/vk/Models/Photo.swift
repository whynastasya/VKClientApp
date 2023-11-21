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
    var nameURL: String
    var likesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case sizes
        case likes
    }
    
    enum SizesCodingKeys: String, CodingKey {
        case nameURL = "url"
    }
    
    enum LikesCodingKeys: String, CodingKey {
        case likesCount = "count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let sizesContainer = try container.nestedContainer(keyedBy: SizesCodingKeys.self, forKey: .sizes)
        self.nameURL = try sizesContainer.decode(String.self, forKey: .nameURL)
        let likesContainer = try container.nestedContainer(keyedBy: LikesCodingKeys.self, forKey: .likes)
        self.likesCount = try likesContainer.decode(Int.self, forKey: .likesCount)
    }
}
