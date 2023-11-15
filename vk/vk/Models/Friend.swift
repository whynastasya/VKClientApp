//
//  User.swift
//  vk
//
//  Created by nastasya on 29.06.2023.
//

import Foundation

struct FriendsResponse: Decodable {
    var response: Friends
}

struct Friends: Decodable {
    var items: [Friend]
}

struct Friend: Decodable {
    var id: Int
    var surname: String
    var name: String
    var age: String?
    var city: String?
    var education: String?
    var avatarURL: String
    var isOnline: Bool
    var lastSeen: LastSeenTime?
    var sex: SexType = .nil
    var birthday: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case education = "university_name"
        case surname = "last_name"
        case name = "first_name"
        case avatarURL = "photo_50"
        case city
        case birthday = "bdate"
        case online
        case lastSeen = "last_seen"
        case sex
    }
    
    enum CityKeys: String, CodingKey {
        case id
        case title
    }
    
    enum LastSeenKeys: String, CodingKey {
        case platform
        case time
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.education = try? container.decode(String.self, forKey: .education)
        self.surname = try container.decode(String.self, forKey: .surname)
        self.name = try container.decode(String.self, forKey: .name)
        self.avatarURL = try container.decode(String.self, forKey: .avatarURL)
        let sex = try container.decode(Int.self, forKey: .sex)
        self.sex = SexType(rawValue: sex) ?? .nil
        
        let cityContainer = try? container.nestedContainer(keyedBy: CityKeys.self, forKey: .city)
        self.city = try cityContainer?.decode(String.self, forKey: .title)
        
        let online = try container.decode(Int.self, forKey: .online)
        self.isOnline = online == 0 ? false : true
        
        let birthday = try? container.decodeIfPresent(String.self, forKey: .birthday)
        self.birthday = getBirthday(birthdayString: birthday ?? "0")
        self.age = self.dateFromMultipleFormats(fromString: birthday)
        
        let lastSeenContainer = try? container.nestedContainer(keyedBy: LastSeenKeys.self, forKey: .lastSeen)
        let time = try? lastSeenContainer?.decode(Int.self, forKey: .time)
        self.lastSeen = self.getLastSeenFromUNIXTime(time: time)
    }
    
    private func dateFromMultipleFormats(fromString dateString: String?) -> String? {
        var formats: [String] = ["dd.MM.yyyy", "dd.MM"]
        let dateFormatter = DateFormatter()
        for format in formats {
            dateFormatter.dateFormat = format
            if let date = dateFormatter.date(from: dateString ?? "0") {
                if format == "dd.MM.yyyy" {
                    let ageComponents = Calendar.current.dateComponents([.year], from: date, to: .now)
                    let age = String(ageComponents.year!)
                    return age
                }
            }
        }
        return nil
    }
    
    private func getLastSeenFromUNIXTime(time: Int?) -> LastSeenTime? {
        let date = NSDate(timeIntervalSince1970: Double(time ?? 0)) as Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        let delta = Int(Date().timeIntervalSince(date as Date))
        
        let today = dateFormatter.string(from: .now)
        let yesterday = dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: -1, to: .now)!)
        let minutes = delta / 60
        let hours = minutes / 60
        let days = hours / 24
        
        if days == 0 && hours == 0 && minutes == 0 {
            return LastSeenTime(personSex: sex, lastSeenType: .seconds, time: "\(delta) секунд")
        } else if days == 0 && hours == 0 {
            return LastSeenTime(personSex: sex, lastSeenType: .minutes, time: "\(minutes) минут")
        } else if days == 0 && hours <= 3 {
            return LastSeenTime(personSex: sex, lastSeenType: .hours, time:"\(hours) часов")
        } else if dateFormatter.string(from: date) == today {
            return LastSeenTime(personSex: sex, lastSeenType: .today, time:"сегодня в \(timeFormatter.string(from: date))")
        } else if dateFormatter.string(from: date) == yesterday {
            return LastSeenTime(personSex: sex, lastSeenType: .yesterday, time:"вчера в \(timeFormatter.string(from: date))")
        } else {
            if dateFormatter.string(from: date) == "1 Jan 1970" {
                return nil
            } else {
                return LastSeenTime(personSex: sex, lastSeenType: .date, time:"\(dateFormatter.string(from: date))")
            }
        }
    }
    
    private func getBirthday(birthdayString: String) -> String? {
        let formats: [String] = ["dd.MM.yyyy", "dd.MM"]
        let dateFormatter = DateFormatter()
        for format in formats {
            dateFormatter.dateFormat = format
            if let birthdayDate = dateFormatter.date(from: birthdayString) {
                let birthdayFormatter = DateFormatter()
                birthdayFormatter.dateFormat = "dd MMMM"
                return birthdayFormatter.string(from: birthdayDate)
            }
        }
        return nil
    }
}
