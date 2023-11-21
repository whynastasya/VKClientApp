//
//  GroupsTableViewController.swift
//  vk
//
//  Created by nastasya on 29.06.2023.
//

import UIKit

final class CommunitiesTableViewController: UITableViewController {
    
    var groups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        VKService().getGroups(with: Session.instance.userID) { groups in
            self.groups = groups
            self.reloadDataWithAnimation()
        }
        tableView.register(UserCommunityTableViewCell.self, forCellReuseIdentifier: UserCommunityTableViewCell.identifier)
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Сообщества"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAvailableGroup(_ :)))
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func reloadDataWithAnimation() {
        UIView.transition(with: tableView,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() }
        )
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: UserCommunityTableViewCell.identifier
        ) as! UserCommunityTableViewCell
        cell.configure(with: groups[indexPath.row].name, description: groups[indexPath.row].theme + ", " + String(groups[indexPath.row].subcribersCount), avatar: groups[indexPath.row].avatarURL)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @objc func addAvailableGroup(_ : UIButton) {
        navigationController?.pushViewController(AvailableCommunitiesTableViewController(), animated: true)
    }
}
