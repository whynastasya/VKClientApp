//
//  FriendCollectionViewCell.swift
//  vk
//
//  Created by nastasya on 01.07.2023.
//

import UIKit

final class FriendCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Friend Cell"
    
    private let publicationImageView = UIImageView()
    private let likeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupPublicationImageView()
        setupLikeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPublicationImageView() {
        contentView.addSubview(publicationImageView)
        publicationImageView.translatesAutoresizingMaskIntoConstraints = false
        publicationImageView.contentMode = .scaleAspectFit
        publicationImageView.backgroundColor = .blue
        NSLayoutConstraint.activate([
            publicationImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            publicationImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            publicationImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            publicationImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupLikeButton() {
        contentView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setImage(UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        likeButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), for: .selected)
        likeButton.addTarget(self, action: #selector(like(_ :)), for: .touchUpInside)
        likeButton.isSelected = false
        NSLayoutConstraint.activate([
            likeButton.widthAnchor.constraint(equalToConstant: 40),
            likeButton.heightAnchor.constraint(equalTo: likeButton.widthAnchor, multiplier: 1),
            likeButton.bottomAnchor.constraint(equalTo: publicationImageView.bottomAnchor, constant: -2),
            likeButton.trailingAnchor.constraint(equalTo: publicationImageView.trailingAnchor, constant: -2)
        ])
    }
    
    @objc func like(_ : UIButton) {
        if likeButton.isSelected == false {
            likeButton.isSelected = true
        } else {
            likeButton.isSelected = false
        }
    }
    
    func configure(with publication: String) {
        publicationImageView.image = UIImage(named: publication)
    }
}
