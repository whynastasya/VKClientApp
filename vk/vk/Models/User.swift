//
//  User.swift
//  vk
//
//  Created by nastasya on 29.06.2023.
//

import Foundation

struct User {
    let surname: String
    let name: String
    let avatar: String
    let publications: [Publication]
    var age: String = ""
    var city: String = ""
}
