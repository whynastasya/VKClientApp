//
//  GroupTableViewCell.swift
//  vk
//
//  Created by nastasya on 30.06.2023.
//

import UIKit

final class UserCommunityTableViewCell: ContentItemTableViewCell {
    
    static let identifier = "User Group"
    
    override func configure(with name: String, description: String, avatar: String) {
        super.configure(with: name, description: description, avatar: avatar)
        descriptionLabel.text = description + " подписчиков"
    }
}
