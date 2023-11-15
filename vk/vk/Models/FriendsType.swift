//
//  FriendsType.swift
//  vk
//
//  Created by nastasya on 11.11.2023.
//

import Foundation

enum FriendsType: String {
    case friends = "Все друзья"
    case followers = "Подписчики"
    case subscriptions = "Отправленные заявки"
    
    static let allCases = [friends, followers, subscriptions]
}
