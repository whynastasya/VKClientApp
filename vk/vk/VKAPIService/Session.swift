//
//  Session.swift
//  vk
//
//  Created by nastasya on 22.08.2023.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init() { }
    
    var token: String = ""
    var userID: Int = 0
}
