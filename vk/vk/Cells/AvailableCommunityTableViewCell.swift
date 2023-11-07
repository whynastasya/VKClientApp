//
//  AvailableGroupTableViewCell.swift
//  vk
//
//  Created by nastasya on 30.06.2023.
//

import UIKit

final class AvailableCommunityTableViewCell: ContentItemTableViewCell {
    
    static let identifier = "Available"
    private let subscribeButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAddButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddButton() {
        contentView.addSubview(subscribeButton)
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.setImage(UIImage(systemName: "plus.app", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal), for: .normal)
        subscribeButton.setImage(UIImage(systemName: "checkmark.square", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .selected)
        subscribeButton.addTarget(self, action: #selector(subscribeCommunity(_ :)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            subscribeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            subscribeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            subscribeButton.widthAnchor.constraint(equalToConstant: 40),
            subscribeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func subscribeCommunity(_ : UIButton) {
        if subscribeButton.isSelected == false {
            subscribeButton.isSelected = true
        } else {
            subscribeButton.isSelected = false
        }
    }
    
    override func configure(with name: String, description: String, avatar: String) {
        super.configure(with: name, description: description, avatar: avatar)
        descriptionLabel.text = description + " подписчиков"
    }
}
