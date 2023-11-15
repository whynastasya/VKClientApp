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
    private let onlineIndicatorImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupOnlineIndicatorImageView()
        setupButtons()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupOnlineIndicatorImageView() {
        contentView.addSubview(onlineIndicatorImageView)
        onlineIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        onlineIndicatorImageView.image = UIImage(systemName: "smartphone")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        onlineIndicatorImageView.contentMode = .scaleAspectFit
    }
    
    private func setupButtons() {
        setupMessageButton()
        setupCallButton()
       
        func setupMessageButton() {
            contentView.addSubview(messageButton)
            messageButton.translatesAutoresizingMaskIntoConstraints = false
            messageButton.setImage(UIImage(systemName: "message.badge", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal), for: .normal)
        }
        
        func setupCallButton() {
            contentView.addSubview(callButton)
            callButton.translatesAutoresizingMaskIntoConstraints = false
            callButton.setImage(UIImage(systemName: "phone", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            onlineIndicatorImageView.widthAnchor.constraint(equalToConstant: 12),
            onlineIndicatorImageView.heightAnchor.constraint(equalToConstant: 15),
            onlineIndicatorImageView.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 3),
            onlineIndicatorImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 0),
            
            messageButton.widthAnchor.constraint(equalToConstant: 40),
            messageButton.heightAnchor.constraint(equalTo: messageButton.widthAnchor, multiplier: 1),
            messageButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            messageButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            callButton.widthAnchor.constraint(equalTo: messageButton.widthAnchor, multiplier: 1),
            callButton.heightAnchor.constraint(equalTo: messageButton.widthAnchor, multiplier: 1),
            callButton.centerYAnchor.constraint(equalTo: messageButton.centerYAnchor),
            callButton.trailingAnchor.constraint(equalTo: messageButton.leadingAnchor, constant: 0)
        ])
    }
    
    func configure(with name: String, description: String?, avatar: String, isOnline: Bool) {
        super.configure(with: name, description: description ?? "", avatar: avatar)
        onlineIndicatorImageView.isHidden = isOnline ? false : true
    }
}
