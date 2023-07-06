//
//  FriendsTableViewController.swift
//  vk
//
//  Created by nastasya on 29.06.2023.
//

import UIKit

final class FriendsTableViewController: UITableViewController {
    
    var publication = [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                       Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                       Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                       Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                       Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                       Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                       Publication(name: "Димулик_7", isLiked: true, likeCount: 11)]
    private var friends = [
        User(fullname: "Димулик Котов", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Настасья", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Галина", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Эдик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "", city: "Москва"),
        User(fullname: "Руслан", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик Савельев", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Митя", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: ""),
        User(fullname: "Бальжина", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Антон", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "", city: "Москва"),
        User(fullname: "Андрей", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик Котов", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Даня", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Полина", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Саша", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "", city: "Москва"),
        User(fullname: "Тимофей", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик Савельев", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Матвей", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: ""),
        User(fullname: "Максим", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик Котов", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик Савельев", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: ""),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: [Publication(name: "Димулик_1", isLiked: true, likeCount: 10),
                            Publication(name: "Димулик_2", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_3", isLiked: false, likeCount: 3),
                            Publication(name: "Димулик_4", isLiked: true, likeCount: 5),
                            Publication(name: "Димулик_5", isLiked: false, likeCount: 11),
                            Publication(name: "Димулик_6", isLiked: true, likeCount: 98),
                            Publication(name: "Димулик_7", isLiked: true, likeCount: 11)],
             age: "19", city: "Москва")]
    
    private var friendsDictionary = [String: [User]]()
    private var sortedFriends = [[User]]()
    private var sectionTitles = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Друзья"
        sortFriends()
    }
    
    private func sortFriends() {
        friendsDictionary = Dictionary(grouping: friends, by: { String($0.fullname.prefix(1))} )
        sortedFriends = Array(friendsDictionary.values)
        sortedFriends.sort(by: { $0[0].fullname < $1[0].fullname })
        sectionTitles = Array(friendsDictionary.keys)
        sectionTitles.sort()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsDictionary[sectionTitles[section]]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier) as! FriendTableViewCell
        let friend = sortedFriends[indexPath.section][indexPath.row]
        if friend.age != "" {
            cell.configure(
                with: friend.fullname,
                description: friend.age + " лет, " + friend.city,
                avatar: friend.avatar
            )
        } else {
            cell.configure(
                with: friend.fullname,
                description: friend.age + friend.city,
                avatar: friend.avatar
            )
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friendCollectionViewController = FriendCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        friendCollectionViewController.friend = friends[indexPath.row]
        navigationController?.pushViewController(friendCollectionViewController, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        friendsDictionary.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitles
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header")
        header?.backgroundConfiguration?.backgroundColor = .black
        return header
    }
}
