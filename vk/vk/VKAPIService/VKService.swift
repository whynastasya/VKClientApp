//
//  VKService.swift
//  vk
//
//  Created by nastasya on 08.11.2023.
//

import Foundation
import Alamofire

final class VKService {
    func getFriends(with userID: Int, completion: @escaping ([Friend]) -> Void) {
        let url = "https://api.vk.com/method/friends.get"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "user_id": userID,
            "order": "hints",
            "fields": "photo_50, city, education, online, bdate, last_seen, sex",
            "v": "5.154"
        ]
        
        AF.request(url, method: .get, parameters: parameters).response { response in
            if let data = response.data {
                guard let friends = try? JSONDecoder().decode(FriendsResponse.self, from: data).response.items else { return }
                completion(friends)
            }
        }
    }
    
    func getGroups(with userID: Int, completion: @escaping ([Group]) -> Void) {
        let url = "https://api.vk.com/method/groups.get"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "extended": "1",
            "user_id": userID,
            "fields": "verified, activity, members_count",
            "v": "5.154"
        ]
        
        AF.request(url, method: .get, parameters: parameters).response { response in
            if let data = response.data {
                guard let groups = try? JSONDecoder().decode(GroupsResponse.self, from: data).response.items else { return }
                completion(groups)
            }
        }
    }
    
    func getPhotos(with userID: Int, completion: @escaping ([Photo]) -> Void) {
        let url = "https://api.vk.com/method/photos.get"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "extended": "1",
            "album_id": "profile",
            "user_id": userID,
            "v": "5.154"
        ]
        
        AF.request(url, method: .get, parameters: parameters).response { response in
            print(response.request)
            if let data = response.data {
                guard let photos = try? JSONDecoder().decode(PhotosResponse.self, from: data).response.items else { return }
                print(photos)
                completion(photos)
            }
        }
    }
}

