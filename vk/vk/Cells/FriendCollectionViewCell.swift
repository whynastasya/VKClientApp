//
//  FriendCollectionViewCell.swift
//  vk
//
//  Created by nastasya on 01.07.2023.
//

import UIKit
import Kingfisher

final class FriendCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Friend Cell"
    
    private let photoImageView = UIImageView()
    private let likeButton = UIButton()
    private let likesCountLabel = UILabel()
    private var likesCount = 0
    
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
        contentView.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.backgroundColor = .black
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
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
            likeButton.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -2),
            likeButton.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -2)
        ])
    }
    
    private func setupLikeCountLabel() {
        contentView.addSubview(likesCountLabel)
        likesCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likesCountLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        likesCountLabel.textColor = .gray
        likesCountLabel.text = "\(likesCount)"
        NSLayoutConstraint.activate([
            likesCountLabel.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor),
            likesCountLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            
        ])
    }
    
    @objc func like(_ : UIButton) {
        if likeButton.isSelected == false {
            likeButton.isSelected = true
            likesCount += 1
            UIView.animate(
                withDuration: 0.5, delay: 0, options: .autoreverse,
                animations: {
                self.likesCountLabel.text = "\(self.likesCount)"
                self.likesCountLabel.textColor = .red
                self.likesCountLabel.transform = self.likesCountLabel.transform.scaledBy(x: 1.2, y: 1.2)
                self.likeButton.transform = self.likeButton.transform.scaledBy(x: 1.2, y: 1.2)
            }, completion: {_ in
                self.likesCountLabel.transform = .identity
                self.likeButton.transform = .identity
            })
        } else {
            likeButton.isSelected = false
            likesCount -= 1
            likesCountLabel.text = "\(likesCount)"
            likesCountLabel.textColor = .gray
        }
    }
    
    func configure(with photo: Photo) {
        UIView.transition(with: photoImageView,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: { self.photoImageView.kf.setImage(with: URL(string: photo.nameURL)) },
                          completion: nil)
        likeButton.isSelected = photo.isLiked
        if photo.isLiked == true {
            likesCountLabel.textColor = .red
        }
        likesCount = photo.likesCount
        likesCountLabel.text = "\(likesCount)"
    }
}
