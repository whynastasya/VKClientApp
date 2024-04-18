//
//  NewsFeedTableViewCell.swift
//  vk
//
//  Created by nastasya on 10.07.2023.
//

import UIKit

final class NewsFeedTableViewCell: UITableViewCell {

    static let identifier = "NewsFeed Cell"
    
    private let backgroundSqureView = UIView()
    private let userAvatar = UIImageView()
    private let userName = UILabel()
    private let dateLabel = UILabel()
    private let photoView = UIView()
    private let photoImageView = UIImageView()
    private let likesButton = UIButton()
    private let commentsButton = UIButton()
    private let viewersLabel = UILabel()
    private var likeCount = 0
    private var photoImages = [UIImage]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupContentViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundSqureView.frame = contentView.bounds
    }
    
    private func setupContentViewCell() {
        backgroundSqureView.layer.cornerRadius = 20
        backgroundSqureView.clipsToBounds = true
        backgroundSqureView.backgroundColor = .vkBlack
        contentView.addSubview(backgroundSqureView)
        setupUserAvatar()
        setupUserName()
        setupDateLabel()
        setupPhotoImageView()
        setupLikesButton()
        setupCommentsButton()
        setupViewersLabel()
        setupButtons()
    }
    
    private func setupUserAvatar() {
        backgroundSqureView.addSubview(userAvatar)
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userAvatar.widthAnchor.constraint(equalToConstant: 40),
            userAvatar.heightAnchor.constraint(equalTo: userAvatar.widthAnchor, multiplier: 1),
            userAvatar.leadingAnchor.constraint(equalTo: backgroundSqureView.leadingAnchor, constant: 5),
            userAvatar.topAnchor.constraint(equalTo: backgroundSqureView.topAnchor, constant: 10)
        ])
        userAvatar.contentMode = .scaleAspectFit
        userAvatar.layer.cornerRadius = 20
        userAvatar.clipsToBounds = true
    }
    
    private func setupUserName() {
        backgroundSqureView.addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        userName.textColor = .vkWhite
        NSLayoutConstraint.activate([
            userName.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            userName.topAnchor.constraint(equalTo: userAvatar.topAnchor, constant: 3)
        ])
    }
    
    private func setupDateLabel() {
        backgroundSqureView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        dateLabel.textColor = .vkGray
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 0),
            dateLabel.leadingAnchor.constraint(equalTo: userName.leadingAnchor)
        ])
    }
    
    private func setupPhotoImageView() {
        backgroundSqureView.addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleToFill
        NSLayoutConstraint.activate([
            photoView.leadingAnchor.constraint(equalTo: backgroundSqureView.leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: backgroundSqureView.trailingAnchor),
            photoView.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 10),
            photoView.heightAnchor.constraint(equalTo: backgroundSqureView.widthAnchor),
            
            photoImageView.leadingAnchor.constraint(equalTo: photoView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: photoView.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: photoView.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: photoView.bottomAnchor)
        ])
        let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipePhoto))
        leftSwipeGestureRecognizer.direction = .left
        photoView.addGestureRecognizer(leftSwipeGestureRecognizer)
        let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipePhoto))
        rightSwipeGestureRecognizer.direction = .right
        photoView.addGestureRecognizer(rightSwipeGestureRecognizer)
    }
    
    @objc func leftSwipePhoto() {
        let index = (photoImages.firstIndex(of: photoImageView.image!))!
        UIView.animate(withDuration: 2, delay: 0, options: .curveLinear, animations: {
            if index < self.photoImages.count - 1 {
                self.photoImageView.image = self.photoImages[index + 1]
                self.photoImageView.image
            } else {
                self.photoImageView.image = self.photoImages[0]
            }
        })
    }
    
    @objc func rightSwipePhoto() {
        let index = (photoImages.firstIndex(of: photoImageView.image!))!
        if index > 0 {
            photoImageView.image = photoImages[index - 1]
        } else {
            photoImageView.image = photoImages[photoImages.count - 1]
        }
    }
    
    private func setupLikesButton() {
        backgroundSqureView.addSubview(likesButton)
        likesButton.translatesAutoresizingMaskIntoConstraints = false
        likesButton.backgroundColor = .vkGray
        likesButton.layer.cornerRadius = 18
        likesButton.setImage(
            UIImage(systemName: "heart",
                    withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.vkGray,
            renderingMode: .alwaysOriginal),
            for: .normal
        )
        likesButton.setAttributedTitle(
            NSAttributedString(string: String(likeCount),
            attributes: [.font: UIFont.systemFont(ofSize: 15,
            weight: .medium),
            .foregroundColor: UIColor.systemRed]),
            for: .selected
        )
        likesButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), for: .selected)
        likesButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        likesButton.addTarget(self, action: #selector(like), for: .touchUpInside)
        NSLayoutConstraint.activate([
            likesButton.leadingAnchor.constraint(equalTo: userAvatar.leadingAnchor),
            likesButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 8),
            likesButton.widthAnchor.constraint(equalToConstant: 70),
            likesButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setupCommentsButton() {
        backgroundSqureView.addSubview(commentsButton)
        commentsButton.translatesAutoresizingMaskIntoConstraints = false
        commentsButton.backgroundColor = .vkLightGray
        commentsButton.layer.cornerRadius = 18
        commentsButton.setImage(UIImage(systemName: "message", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.vkGray, renderingMode: .alwaysOriginal), for: .normal)
        commentsButton.setTitleColor(.vkGray, for: .normal)
        commentsButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        NSLayoutConstraint.activate([
            commentsButton.leadingAnchor.constraint(equalTo: likesButton.trailingAnchor, constant: 5),
            commentsButton.topAnchor.constraint(equalTo: likesButton.topAnchor),
            commentsButton.widthAnchor.constraint(equalTo: likesButton.widthAnchor, multiplier: 1),
            commentsButton.heightAnchor.constraint(equalTo: likesButton.heightAnchor, multiplier: 1)
        ])
    }
    
    private func setupViewersLabel() {
        backgroundSqureView.addSubview(viewersLabel)
        viewersLabel.translatesAutoresizingMaskIntoConstraints = false
        viewersLabel.font = UIFont.systemFont(ofSize: 15)
        viewersLabel.textColor = .vkGray
        NSLayoutConstraint.activate([
            viewersLabel.trailingAnchor.constraint(equalTo: backgroundSqureView.trailingAnchor, constant: -5),
            viewersLabel.centerYAnchor.constraint(equalTo: likesButton.centerYAnchor)
        ])
    }
    
    private func createMutableAttributedStringForViewersLabel(viewersCount: String) -> NSMutableAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "eye.fill")?.withTintColor(.vkGray, renderingMode: .alwaysOriginal)
        attachment.bounds = CGRect(x: -2, y: -1, width: 18, height: 12)
        let attachmentStr = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentStr)

        let textString = NSAttributedString(string: " " + viewersCount)
        mutableAttributedString.append(textString)
        return mutableAttributedString
    }
    
    private func setupButtons() {
        setupMoreButton()
        setupRepostButton()
        
        func setupMoreButton() {
            let moreButton = UIButton()
            backgroundSqureView.addSubview(moreButton)
            moreButton.translatesAutoresizingMaskIntoConstraints = false
            moreButton.setImage(UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.vkGray, renderingMode: .alwaysOriginal), for: .normal)
            NSLayoutConstraint.activate([
                moreButton.trailingAnchor.constraint(equalTo: backgroundSqureView.trailingAnchor, constant: -15),
                moreButton.centerYAnchor.constraint(equalTo: userAvatar.centerYAnchor)
            ])
        }
        
        func setupRepostButton() {
            let repostButton = UIButton()
            backgroundSqureView.addSubview(repostButton)
            repostButton.translatesAutoresizingMaskIntoConstraints = false
            repostButton.backgroundColor = .vkLightGray
            repostButton.layer.cornerRadius = 18
            repostButton.setImage(
                UIImage(systemName: "arrowshape.turn.up.right",
                        withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.vkGray,
                renderingMode: .alwaysOriginal),
                for: .normal
            )
            NSLayoutConstraint.activate([
                repostButton.leadingAnchor.constraint(equalTo: commentsButton.trailingAnchor, constant: 5),
                repostButton.topAnchor.constraint(equalTo: likesButton.topAnchor),
                repostButton.widthAnchor.constraint(equalTo: likesButton.widthAnchor, multiplier: 0.7),
                repostButton.heightAnchor.constraint(equalTo: likesButton.heightAnchor, multiplier: 1)
            ])
        }
    }
    
    @objc func like() {
        if likesButton.isSelected == false {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.likesButton.imageView?.transform = (self.likesButton.imageView?.transform.scaledBy(x: 1.2, y: 1.2))!
                self.likesButton.isSelected = true
                self.likeCount += 1
                self.likesButton.backgroundColor = .systemRed.withAlphaComponent(0.2)
                self.likesButton.setAttributedTitle(
                    NSAttributedString(string: String(self.likeCount),
                    attributes: [.font: UIFont.systemFont(ofSize: 15,
                    weight: .medium),
                    .foregroundColor: UIColor.systemRed]),
                    for: .selected
                )
            }, completion: { _ in
                self.likesButton.imageView?.transform = .identity
            })
        } else {
            likesButton.isSelected = false
            likeCount -= 1
            likesButton.backgroundColor = .vkLightGray
            likesButton.setAttributedTitle(
                NSAttributedString(string: String(likeCount),
                attributes: [.font: UIFont.systemFont(ofSize: 15,
                weight: .medium),
                             .foregroundColor: UIColor.vkGray]),
                for: .normal
            )
        }
    }
    
    func configure(publication: Publication) {
//        userAvatar.image = UIImage(named: publication.user.avatar)
//        userName.text = publication.user.surname + " " + publication.user.name
        dateLabel.text = publication.date
        photoImageView.image = UIImage(named: publication.photos[0])
        for photo in publication.photos {
            photoImages.append((UIImage(named: photo))!)
        }
//        photoImageView.animationImages = photoImages
//        photoImageView.animationDuration = 10
//        photoImageView.startAnimating()
        
        likeCount = publication.likeCount
        if publication.isLiked == true {
            likesButton.isSelected = true
            likesButton.setAttributedTitle(
                NSAttributedString(string: String(likeCount),
                attributes: [.font: UIFont.systemFont(ofSize: 15,
                weight: .medium),
                .foregroundColor: UIColor.vkRed]),
                for: .selected
            )
            likesButton.backgroundColor = .vkLightRed
        } else {
            likesButton.isSelected = false
            likesButton.setAttributedTitle(
                NSAttributedString(string: String(likeCount),
                attributes: [.font: UIFont.systemFont(ofSize: 15,
                weight: .medium),
                             .foregroundColor: UIColor.vkGray]),
                for: .normal
            )
            likesButton.backgroundColor = .vkLightGray
        }
        
        commentsButton.setAttributedTitle(NSAttributedString(string: String(publication.commentCount), attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .medium), .foregroundColor: UIColor.vkGray]), for: .normal)
        
        let mutableAttributedString = createMutableAttributedStringForViewersLabel(viewersCount: String(publication.viewerCount))
        viewersLabel.attributedText = mutableAttributedString
    }
}
