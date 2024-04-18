//
//  NewsFeedTableViewController.swift
//  vk
//
//  Created by nastasya on 28.06.2023.
//

import UIKit

final class NewsFeedTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .vkBlack
        setupNavigationBar()
        tableView.register(NewsFeedTableViewCell.self, forCellReuseIdentifier: NewsFeedTableViewCell.identifier)
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.identifier)
    }
    
    private func setupNavigationBar() {
        let titleView = UIView()
        
        let userAvatar = UIImageView()
        titleView.addSubview(userAvatar)
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        userAvatar.image = UIImage(named: "avatar")
        userAvatar.contentMode = .scaleAspectFill
        userAvatar.clipsToBounds = true
        userAvatar.layer.cornerRadius = 14
        
        let titleLabel = UILabel()
        titleView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Главная"
        titleLabel.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        titleLabel.textColor = .vkWhite
        
        let segmentedControl = UISegmentedControl()
        titleView.addSubview(segmentedControl)
        segmentedControl.backgroundColor = .vkPurple
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userAvatar.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            userAvatar.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 15),
            userAvatar.widthAnchor.constraint(equalToConstant: 28),
            userAvatar.heightAnchor.constraint(equalTo: userAvatar.widthAnchor, multiplier: 1),
            
            titleLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
            
        ])
        titleView.backgroundColor = .vkPurple
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
        navigationController?.navigationBar.backgroundColor = .vkBlack
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "bell", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "plus.circle", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .done, target: self, action: nil)
        ]
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        publications.count + 1
        40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: StoriesTableViewCell.identifier) as? StoriesTableViewCell else { return UITableViewCell() }
//                cell.configure(with: users)
                return cell
            default:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: NewsFeedTableViewCell.identifier) as? NewsFeedTableViewCell else { return UITableViewCell() }
//                cell.configure(publication: publications[indexPath.row - 1])
                return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case 0:
                return 110
            default:
                return 510
        }
    }
}
