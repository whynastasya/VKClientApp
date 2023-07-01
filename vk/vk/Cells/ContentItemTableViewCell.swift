//
//  ContentItemTableViewCell.swift
//  vk
//
//  Created by nastasya on 30.06.2023.
//

import UIKit

class ContentItemTableViewCell: UITableViewCell {

    private let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    private let avatarImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAvatarImageView()
        setupNameLabel()
        setupDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
    }
    
    private func setupDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        descriptionLabel.textColor = .gray
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
    
    private func setupAvatarImageView() {
        contentView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleToFill
        avatarImageView.layer.cornerRadius = 22
        avatarImageView.clipsToBounds = true
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 44),
            avatarImageView.heightAnchor.constraint(equalToConstant: 44),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
    }
    
    func configure(with name: String, description: String, avatar: String) {
        nameLabel.text = name
        descriptionLabel.text = description
        avatarImageView.image = UIImage(named: avatar)
    }
}
