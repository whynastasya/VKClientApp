//
//  HeaderTableViewCell.swift
//  vk
//
//  Created by nastasya on 10.11.2023.
//

import UIKit

final class HeaderFriendsTableViewCell: UITableViewCell {

    static let identifier = "HeaderFriendsTableViewCell"
    
    private let titleLabel = UILabel()
    private let countTitleLabel = UILabel()
    let sortingButton = UIButton()
    let friendsTypeButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        setupTitleLabel()
        setupCountTitleLabel()
        setupSortingButton()
        setupTypePeopleButton()
        setupConstraints()
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.text = "TextText"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupCountTitleLabel() {
        contentView.addSubview(countTitleLabel)
        countTitleLabel.text = "000"
        countTitleLabel.font = .systemFont(ofSize: 13, weight: .medium)
        countTitleLabel.textColor = .gray
        countTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSortingButton() {
        contentView.addSubview(sortingButton)
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "arrow.up.arrow.down")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        configuration.title = "Сортировка: По важности"
        configuration.titleAlignment = .leading
        configuration.preferredSymbolConfigurationForImage = .init(scale: .medium)
        configuration.imagePlacement = .trailing
        configuration.baseForegroundColor = .gray
        configuration.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .system(size: 10, weight: .medium)
            return outgoing
        }
        sortingButton.configuration = configuration
        sortingButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTypePeopleButton() {
        contentView.addSubview(friendsTypeButton)
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "chevron.down")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        configuration.preferredSymbolConfigurationForImage = .init(scale: .medium)
        configuration.title = "Списки"
        configuration.imagePlacement = .trailing
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .system(size: 13, weight: .medium)
            return outgoing
        }
        friendsTypeButton.configuration = configuration
        friendsTypeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            countTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
            countTitleLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            sortingButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            sortingButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

            friendsTypeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            friendsTypeButton.topAnchor.constraint(equalTo: titleLabel.topAnchor)
        ])
    }
    
    func configure(friendsType: FriendsType, countPeople: Int) {
        titleLabel.text = friendsType.rawValue
        if friendsType == .friends {
            titleLabel.text = "Мои друзья"
        }
        countTitleLabel.text = String(countPeople)
    }
}
