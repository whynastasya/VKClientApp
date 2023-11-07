//
//  NewsFeedTableViewController.swift
//  vk
//
//  Created by nastasya on 28.06.2023.
//

import UIKit

final class NewsFeedTableViewController: UITableViewController {
    
    private let publications = [
           Publication(
            user: User(surname: "Котов", name: "Димулик", avatar: "Димулик", publications: []),
            photos: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
            date: "вчера в 22:34",
            isLiked: false, likeCount: 10,
            commentCount: 5, viewerCount: 39),
           Publication(
            user: User(surname: "Григорчук", name: "Настасья", avatar: "Димулик", publications: []),
            photos: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
            date: "час назад",
            isLiked: true, likeCount: 45,
            commentCount: 2, viewerCount: 189),
           Publication(
            user: User(surname: "Тёплый", name: "Антон", avatar: "Димулик", publications: []),
            photos: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
            date: "два часа назад",
            isLiked: false, likeCount: 3,
            commentCount: 0, viewerCount: 39),
           Publication(
            user: User(surname: "Рзаев", name: "Руслан", avatar: "Димулик", publications: []),
            photos: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
            date: "вчера в 22:34",
            isLiked: false, likeCount: 23,
            commentCount: 52, viewerCount: 560),
           Publication(
            user: User(surname: "Лопиталь", name: "Бальжина", avatar: "Димулик", publications: []),
            photos: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
            date: "сегодня в 02:51",
            isLiked: false, likeCount: 122,
            commentCount: 9, viewerCount: 189),
           Publication(
            user: User(surname: "Еленский", name: "Эдуард", avatar: "Димулик", publications: []),
            photos: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
            date: "вчера в 22:34",
            isLiked: true, likeCount: 10,
            commentCount: 5, viewerCount: 39),
           Publication(
            user: User(surname: "Стриж", name: "Иван", avatar: "Димулик", publications: []),
            photos: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
            date: "вчера в 22:34",
            isLiked: true, likeCount: 10,
            commentCount: 5, viewerCount: 39)
    ]
    
    private var users = [
        User(surname: "Котов", name: "Димулик", avatar: "Димулик", publications: []),
        User(surname: "Григорчук", name: "Настасья", avatar: "Димулик", publications: []),
        User(surname: "Тёплый", name: "Антон", avatar: "Димулик", publications: []),
        User(surname: "Рзаев", name: "Руслан", avatar: "Димулик", publications: []),
        User(surname: "Лопиталь", name: "Бальжина", avatar: "Димулик", publications: []),
        User(surname: "Еленский", name: "Эдуард", avatar: "Димулик", publications: []),
        User(surname: "Стриж", name: "Иван", avatar: "Димулик", publications: [])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
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
        titleLabel.textColor = .white
        
        let segmentedControl = UISegmentedControl()
        titleView.addSubview(segmentedControl)
        segmentedControl.backgroundColor = .purple
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
        titleView.backgroundColor = .purple
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
        navigationController?.navigationBar.backgroundColor = .black
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
        publications.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: StoriesTableViewCell.identifier) as? StoriesTableViewCell else { return UITableViewCell() }
                cell.configure(with: users)
                return cell
            default:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: NewsFeedTableViewCell.identifier) as? NewsFeedTableViewCell else { return UITableViewCell() }
                cell.configure(publication: publications[indexPath.row - 1])
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
