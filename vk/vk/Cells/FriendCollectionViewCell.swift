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
    private let likeCountLabel = UILabel()
    private var likeCount = 0
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupPublicationImageView()
        setupLikeButton()
        setupLikeCountLabel()
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
    
    private func setupLikeCountLabel() {
        contentView.addSubview(likeCountLabel)
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCountLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        likeCountLabel.textColor = .gray
        likeCountLabel.text = "\(likeCount)"
        NSLayoutConstraint.activate([
            likeCountLabel.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor),
            likeCountLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            
        ])
    }
    
    @objc func like(_ : UIButton) {
        if likeButton.isSelected == false {
            likeButton.isSelected = true
            likeCount += 1
            UIView.animate(
                withDuration: 0.5, delay: 0, options: .autoreverse,
                animations: {
                self.likeCountLabel.text = "\(self.likeCount)"
                self.likeCountLabel.textColor = .red
                self.likeCountLabel.transform = self.likeCountLabel.transform.scaledBy(x: 1.2, y: 1.2)
                self.likeButton.transform = self.likeButton.transform.scaledBy(x: 1.2, y: 1.2)
            }, completion: {_ in
                self.likeCountLabel.transform = .identity
                self.likeButton.transform = .identity
            })
        } else {
            likeButton.isSelected = false
            likeCount -= 1
            likeCountLabel.text = "\(likeCount)"
            likeCountLabel.textColor = .gray
        }
    }
    
    func configure(with publication: Publication) {
        publicationImageView.image = UIImage(named: publication.photos[0])
        likeButton.isSelected = publication.isLiked
        if publication.isLiked == true {
            likeCountLabel.textColor = .red
        }
        likeCount = publication.likeCount
        likeCountLabel.text = "\(likeCount)"
    }
}
