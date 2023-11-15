//
//  VKService.swift
//  vk
//
//  Created by nastasya on 08.11.2023.
//

import Foundation
import Alamofire

final class VKService {
    func getFriends(with userID: Int) async -> [Friend] {
        let url = "https://api.vk.com/method/friends.get"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "user_id": userID,
            "order": "hints",
            "fields": "photo_50, city, education, online, bdate, last_seen, sex",
            "v": "5.154"
        ]
        
        return await withCheckedContinuation { continuation in
            AF.request(url, method: .get, parameters: parameters).response { response1 in
                if let data = response1.data {
                    guard let friends = try? JSONDecoder().decode(FriendsResponse.self, from: data).response.items else { return }
                    continuation.resume(returning: friends)
                }
            }
        }
    }
}

