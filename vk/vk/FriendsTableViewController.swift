//
//  FriendsTableViewController.swift
//  vk
//
//  Created by nastasya on 29.06.2023.
//

import UIKit

final class FriendsTableViewController: UITableViewController {
    
    let friends = [
        User(fullname: "Димулик Котов", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик Савельев", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: ""),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик Котов", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик Савельев", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: ""),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик Котов", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик Савельев", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: ""),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "", city: "Москва"),
        User(fullname: "Димулик", avatar: "Димулик",
             publications: ["Димулик_1", "Димулик_2", "Димулик_3", "Димулик_4", "Димулик_5", "Димулик_6", "Димулик_7"],
             age: "19", city: "Москва"),]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Друзья"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier) as! FriendTableViewCell
        if friends[indexPath.row].age != "" {
            cell.configure(
                with: friends[indexPath.row].fullname,
                description: friends[indexPath.row].age + " лет, " + friends[indexPath.row].city,
                avatar: friends[indexPath.row].avatar
            )
        } else {
            cell.configure(
                with: friends[indexPath.row].fullname,
                description: friends[indexPath.row].age + friends[indexPath.row].city,
                avatar: friends[indexPath.row].avatar
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
}
