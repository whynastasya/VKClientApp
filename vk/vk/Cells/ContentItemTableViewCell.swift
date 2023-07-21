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
    private let avatarView = UIView()
    
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
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 10),
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
        contentView.addSubview(avatarView)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.layer.cornerRadius = 22
        avatarView.backgroundColor = .purple
        avatarView.clipsToBounds = true
        NSLayoutConstraint.activate([
            avatarView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 44),
            avatarView.heightAnchor.constraint(equalToConstant: 44),
            avatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        avatarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarTapped(_ :))))
        
        avatarView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.cornerRadius = 22
        avatarImageView.clipsToBounds = true
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 44),
            avatarImageView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
                                        
    @objc func avatarTapped(_: UIView) {
        UIView.animate(withDuration: 0.7, delay: 0, options: [.allowUserInteraction, .autoreverse],
                       animations: {
            self.avatarView.transform = self.avatarView.transform.scaledBy(x: 1.15, y: 1.15)
        }, completion: { _ in
            self.avatarView.transform = .identity
        })
    }
    
 
    func configure(with name: String, description: String, avatar: String) {
        nameLabel.text = name
        descriptionLabel.text = description
        avatarImageView.image = UIImage(named: avatar)
    }
}