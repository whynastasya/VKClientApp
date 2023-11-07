//
//  StoriesTableViewCell.swift
//  vk
//
//  Created by nastasya on 13.07.2023.
//

import UIKit

final class StoriesTableViewCell: UITableViewCell {
    
    static let identifier = "Stories Cell"
    
    private let storiesScrollView = UIScrollView()
    private var usersWithStoriesCount = 50
    private var storiesPreviewImageViews = [UIImageView]()
    private var storiesNameLabels = [UILabel]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStoriesScrollView()
        updateLayoutStoriesView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateStoriesScrollViewDimensions()
    }
    
    private func updateStoriesScrollViewDimensions() {
        storiesScrollView.frame = contentView.bounds
        let widthPerStory = Constants.storiesDimensions + Constants.storiesXOffset
        storiesScrollView.contentSize = CGSize(
            width: widthPerStory * CGFloat(usersWithStoriesCount + 1),
            height: contentView.bounds.height
        )
    }
    
    private func setupStoriesScrollView() {
        storiesScrollView.backgroundColor = .black
        storiesScrollView.showsHorizontalScrollIndicator = false
        storiesScrollView.showsVerticalScrollIndicator = false
        contentView.addSubview(storiesScrollView)
    }
    
    func createStoriesView() -> UIView {
        let storiesView = UIView()
        storiesView.layer.cornerRadius = Constants.storiesDimensions / 2
        storiesView.backgroundColor = .systemBlue
        
        return storiesView
    }
    
    func updateLayoutStoriesView() {
        for index in 0..<usersWithStoriesCount {
            let precedingStoriesWidths = CGFloat(index) * Constants.storiesDimensions
            let precedingStoriesOffsets = CGFloat(index + 1) * Constants.storiesXOffset
            let currentViewOffset =  precedingStoriesWidths + precedingStoriesOffsets
            let storiesView = createStoriesView()
            storiesView.frame = CGRectMake(
                currentViewOffset,
                10,
                Constants.storiesDimensions,
                Constants.storiesDimensions
            )
            storiesScrollView.addSubview(storiesView)
            
            let storyPreviewImageView = createStoryPreviewImageView()
            storiesView.addSubview(storyPreviewImageView)
            
            let storyNameLabel = createStoryNameLabel()
            storiesView.addSubview(storyNameLabel)
            storyNameLabel.topAnchor.constraint(equalTo: storiesView.bottomAnchor, constant: 1).isActive = true
            storyNameLabel.centerXAnchor.constraint(equalTo: storiesView.centerXAnchor, constant: 1).isActive = true
            
            if index == 0 {
                storyNameLabel.text = "ffff"
                storyPreviewImageView.image = UIImage(named: "avatar")
                storyPreviewImageView.contentMode = .scaleAspectFill
                let plusImageView = createPlusImageView()
                storiesView.addSubview(plusImageView)
                storiesView.backgroundColor = .black
            } else {
                storiesPreviewImageViews.append(storyPreviewImageView)
                storiesNameLabels.append(storyNameLabel)
            }
        }
    }
    
    private func createStoryPreviewImageView() -> UIImageView {
        let userAvatarImageView = UIImageView()
        let userAvatarDimmension = Constants.storiesDimensions - 5
        userAvatarImageView.frame = CGRectMake(2.5, 2.5, userAvatarDimmension, userAvatarDimmension)
        userAvatarImageView.layer.cornerRadius = userAvatarDimmension / 2
        userAvatarImageView.layer.borderWidth = 3
        userAvatarImageView.layer.borderColor = UIColor.black.cgColor
        userAvatarImageView.clipsToBounds = true
        userAvatarImageView.contentMode = .scaleAspectFit
        return userAvatarImageView
    }
    
    private func createStoryNameLabel() -> UILabel {
        let userNameLabel = UILabel()
        userNameLabel.textColor = .white
        userNameLabel.font = UIFont.systemFont(ofSize: 13)
        userNameLabel.textAlignment = .center
        storiesScrollView.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return userNameLabel
    }
    
    private func createPlusImageView() -> UIImageView {
        let plusImageView = UIImageView()
        plusImageView.image = UIImage(systemName: "plus.circle.fill")
        plusImageView.tintColor = .systemBlue
        plusImageView.backgroundColor = .white
        plusImageView.frame = CGRect(x: 45, y: 45, width: 25, height: 25)
        plusImageView.layer.cornerRadius = plusImageView.frame.width / 2
        plusImageView.layer.borderWidth = 3
        plusImageView.layer.borderColor = UIColor.black.cgColor
        return plusImageView
    }
    
    func configure(with users: [User]) {
        usersWithStoriesCount = users.count
        for index in 0..<usersWithStoriesCount {
            storiesPreviewImageViews[index].image = UIImage(named: users[index].avatar)
            storiesNameLabels[index].text = users[index].name
        }
    }
}

