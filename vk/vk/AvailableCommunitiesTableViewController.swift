//
//  AvailableGroupsTableViewController.swift
//  vk
//
//  Created by nastasya on 30.06.2023.
//

import UIKit

final class AvailableCommunitiesTableViewController: UITableViewController {

    var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            AvailableCommunityTableViewCell.self,
            forCellReuseIdentifier: AvailableCommunityTableViewCell.identifier
        )
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isTranslucent = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AvailableCommunityTableViewCell.identifier) as! AvailableCommunityTableViewCell
        cell.configure(with: groups[indexPath.row].name, description: groups[indexPath.row].theme + ", " + String(groups[indexPath.row].subcribersCount), avatar: groups[indexPath.row].avatarURL)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
