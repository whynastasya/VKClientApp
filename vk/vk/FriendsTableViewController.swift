//
//  FriendsTableViewController.swift
//  vk
//
//  Created by nastasya on 29.06.2023.
//

import UIKit

final class FriendsTableViewController: UITableViewController {
    
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
        friendsDictionary = Dictionary(grouping: Users.friends, by: { String($0.surname.prefix(1))} )
        sortedFriends = Array(friendsDictionary.values)
        sortedFriends.sort(by: { $0[0].surname < $1[0].surname })
        sectionTitles = Array(friendsDictionary.keys)
        sectionTitles.sort()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsDictionary[sectionTitles[section]]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier) as! FriendTableViewCell
        let friend = sortedFriends[indexPath.section][indexPath.row]
        if friend.age != "" && friend.city != "" {
            cell.configure(
                with: friend.surname + " " + friend.name,
                description: friend.age + " лет, " + friend.city,
                avatar: friend.avatar
            )
        } else if friend.age != "" {
            cell.configure(
                with: friend.surname + " " + friend.name,
                description: friend.age + " лет",
                avatar: friend.avatar
            )
        } else {
            cell.configure(
                with: friend.surname + " " + friend.name,
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
        friendCollectionViewController.friend = Users.friends[indexPath.row]
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
