//
//  OrderType.swift
//  vk
//
//  Created by nastasya on 11.11.2023.
//

import Foundation

enum OrderType: String {
    case hints = "По важности"
    case name = "По имени"
    case online = "Сначала онлайн"
    case birthday = "По дате дня рождения"
    case recentlyAdded = "Недавно добавленные"
    
    static let allCases = [hints, name, online, recentlyAdded, birthday]
}
