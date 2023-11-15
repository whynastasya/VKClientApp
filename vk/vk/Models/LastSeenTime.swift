//
//  LastSeenType.swift
//  vk
//
//  Created by nastasya on 13.11.2023.
//

import Foundation

struct LastSeenTime {
    var lastSeenText: String
    var lastSeenType: LastSeenType?
    
    enum LastSeenType: Int {
        case seconds = 0
        case minutes = 1
        case hours = 2
        case today = 3
        case yesterday = 4
        case date = 5
    }
    
    init(personSex: SexType, lastSeenType: LastSeenType, time: String) {
        self.lastSeenType = lastSeenType
        let sexTypeString = personSex == .female ? "Заходила" : "Заходил"
        switch lastSeenType {
            case .seconds:
                self.lastSeenText = sexTypeString + " " + time + " назад"
            case .minutes:
                self.lastSeenText = sexTypeString + " " + time + " назад"
            case .hours:
                self.lastSeenText = sexTypeString + " " + time + " назад"
            case .today:
                self.lastSeenText = sexTypeString + " " + time
            case .yesterday:
                self.lastSeenText = sexTypeString + " " + time
            case .date:
                self.lastSeenText = sexTypeString + " " + String(time)
        }
    }
}
