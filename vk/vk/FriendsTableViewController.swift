//
//  FriendsTableViewController.swift
//  vk
//
//  Created by nastasya on 29.06.2023.
//

import UIKit

final class FriendsTableViewController: UITableViewController {
    
    private var friends = [Friend]()
    private var filteredFriends = [Friend]()
    private var friendsType = FriendsType.friends
    private var orderType = OrderType.hints
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        VKService().getFriends(with: Session.instance.userID) { friends in
            self.friends = friends
            self.reloadDataWithAnimation()
        }
        setupTableView()
        setupNavigationBar()
        setupSearchController()
    }
    
    private func setupTableView() {
        tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
        tableView.register(HeaderFriendsTableViewCell.self, forCellReuseIdentifier: HeaderFriendsTableViewCell.identifier)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isTranslucent = false

        let titleLabel = UILabel(frame: CGRectMake(0, 0, 200, 50))
        titleLabel.text = "Друзья"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Поиск"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc func changeFriendsType() {
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for friendsType in FriendsType.allCases {
            let alertAction = UIAlertAction(title: friendsType.rawValue, style: .default) { _ in
                self.friendsType = friendsType
            }
            actionSheetController.addAction(alertAction)
        }
        actionSheetController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(actionSheetController, animated: true)
    }
    
    @objc func changeOrderType() {
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for orderType in OrderType.allCases {
            let alertAction = UIAlertAction(title: orderType.rawValue, style: .default) { _ in
                self.orderType = orderType
                self.sortFriends()
            }
            actionSheetController.addAction(alertAction)
        }
        actionSheetController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(actionSheetController, animated: true)
    }
    
    private func sortFriends() {
        switch orderType {
            case .hints:
                VKService().getFriends(with: Session.instance.userID) { friends in
                    self.friends = friends
                    self.reloadDataWithAnimation()
                }
            case .name:
                friends.sort {
                    if $0.surname == $1.surname {
                        return $0.name > $1.name
                    }
                    return $0.surname > $1.surname
                }
                reloadDataWithAnimation()
            case .online:
                friends.sort {
                    $0.isOnline && !$1.isOnline
                }
                friends.sort {
                    $0.lastSeen?.lastSeenType?.rawValue ?? 5 < $1.lastSeen?.lastSeenType?.rawValue ?? 5
                }
                reloadDataWithAnimation()
            case .birthday:
                friends.sort {
                    $0.birthday ?? "" < $1.birthday ?? ""
                }
                reloadDataWithAnimation()
            case .recentlyAdded:
                friends.shuffle()
                reloadDataWithAnimation()
        }
    }
    
    private func reloadDataWithAnimation() {
        UIView.transition(with: tableView,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() }
        )
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredFriends.count
        } else {
            return friends.count + 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var friend: Friend
        if isFiltering {
            friend = filteredFriends[indexPath.row]
        } else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: HeaderFriendsTableViewCell.identifier) as! HeaderFriendsTableViewCell
                cell.sortingButton.addTarget(self, action: #selector(changeOrderType), for: .touchUpInside)
                cell.sortingButton.setTitle("Сортировка: " + orderType.rawValue, for: .normal)
                cell.friendsTypeButton.addTarget(self, action: #selector(changeFriendsType), for: .touchUpInside)
                cell.configure(friendsType: friendsType, countPeople: friends.count)
                return cell
            } else {
                friend = friends[indexPath.row - 1]
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier) as! FriendTableViewCell
        
        switch orderType {
            case .hints:
                cellConfigureWithAgeCityEducation()
            case .name:
                cellConfigureWithAgeCityEducation()
            case .online:
                if friend.isOnline == true {
                    cell.configure(
                        with: friend.surname + " " + friend.name,
                        description: "online",
                        avatar: friend.avatarURL,
                        isOnline: friend.isOnline
                    )
                } else {
                    cell.configure(
                        with: friend.surname + " " + friend.name,
                        description: friend.lastSeen?.lastSeenText,
                        avatar: friend.avatarURL,
                        isOnline: friend.isOnline
                    )
                }
            case .birthday:
                cell.configure(
                    with: friend.surname + " " + friend.name,
                    description: friend.birthday,
                    avatar: friend.avatarURL,
                    isOnline: friend.isOnline
                )
            case .recentlyAdded:
                cellConfigureWithAgeCityEducation()
        }
        return cell
        
        func cellConfigureWithAgeCityEducation() {
            if friend.age != nil && friend.city != nil {
                cell.configure(
                    with: friend.surname + " " + friend.name,
                    description: friend.age! +  " лет, " + friend.city!,
                    avatar: friend.avatarURL,
                    isOnline: friend.isOnline
                )
            } else if friend.age != nil {
                cell.configure(
                    with: friend.surname + " " + friend.name,
                    description: friend.age! +  " лет",
                    avatar: friend.avatarURL,
                    isOnline: friend.isOnline
                )
            } else if friend.city != nil {
                cell.configure(
                    with: friend.surname + " " + friend.name,
                    description: friend.city!,
                    avatar: friend.avatarURL,
                    isOnline: friend.isOnline
                )
            } else if friend.education != nil {
                cell.configure(
                    with: friend.surname + " " + friend.name,
                    description: friend.education!,
                    avatar: friend.avatarURL,
                    isOnline: friend.isOnline
                )
            } else {
                cell.configure(
                    with: friend.surname + " " + friend.name,
                    description: "",
                    avatar: friend.avatarURL,
                    isOnline: friend.isOnline
                )
            }
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            let friendCollectionViewController = FriendCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
            var friend: Friend
            if isFiltering {
                friend = filteredFriends[indexPath.row]
            } else {
                friend = friends[indexPath.row - 1]
            }
            friendCollectionViewController.friend = friend
            navigationController?.pushViewController(friendCollectionViewController, animated: true)
        }
    }
}

extension FriendsTableViewController: UISearchControllerDelegate {
    
}

extension FriendsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredFriends = friends.filter({ (friend: Friend) -> Bool in
            let isContains = friend.surname.lowercased().contains(searchText.lowercased()) || friend.name.lowercased().contains(searchText.lowercased())
            return isContains
        })
        tableView.reloadData()
    }
}
