//
//  FriendTableViewCell.swift
//  vk
//
//  Created by nastasya on 30.06.2023.
//

import UIKit

final class FriendTableViewCell: ContentItemTableViewCell {
    
    static let identifier = "Friend Cell"
    private let messageButton = UIButton()
    private let callButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtons() {
        setupMessageButton()
        setupCallButton()
       
        func setupMessageButton() {
            contentView.addSubview(messageButton)
            messageButton.translatesAutoresizingMaskIntoConstraints = false
            messageButton.setImage(UIImage(systemName: "message.badge", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal), for: .normal)
            NSLayoutConstraint.activate([
                messageButton.widthAnchor.constraint(equalToConstant: 40),
                messageButton.heightAnchor.constraint(equalTo: messageButton.widthAnchor, multiplier: 1),
                messageButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                messageButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
            ])
        }
        
        func setupCallButton() {
            contentView.addSubview(callButton)
            callButton.translatesAutoresizingMaskIntoConstraints = false
            callButton.setImage(UIImage(systemName: "phone", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal), for: .normal)
            NSLayoutConstraint.activate([
                callButton.widthAnchor.constraint(equalTo: messageButton.widthAnchor, multiplier: 1),
                callButton.heightAnchor.constraint(equalTo: messageButton.widthAnchor, multiplier: 1),
                callButton.centerYAnchor.constraint(equalTo: messageButton.centerYAnchor),
                callButton.trailingAnchor.constraint(equalTo: messageButton.leadingAnchor, constant: 0)
            ])
        }
    }
}
