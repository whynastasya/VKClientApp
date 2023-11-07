//
//  GroupsTableViewController.swift
//  vk
//
//  Created by nastasya on 29.06.2023.
//

import UIKit

final class CommunitiesTableViewController: UITableViewController {
    
    var groups = [
        Community(name: "Fast Food Music", avatar: "Fast_Food_Music", theme: "Интернет-СМИ", subcribersCount: "701 413"),
        Community(name: "Андеграунд Бурятии", avatar: "Андеграунд_Бурятии", theme: "Юмор", subcribersCount: "74 793"),
        Community(name: "Гранит Науки (КБ-3)", avatar: "Гранит_Науки", theme: "Образование", subcribersCount: "596"),
        Community(name: "Fast Food Music", avatar: "Fast_Food_Music", theme: "Интернет-СМИ", subcribersCount: "701 413"),
        Community(name: "Андеграунд Бурятии", avatar: "Андеграунд_Бурятии", theme: "Юмор", subcribersCount: "74 793"),
        Community(name: "Гранит Науки (КБ-3)", avatar: "Гранит_Науки", theme: "Образование", subcribersCount: "596"),
        Community(name: "Fast Food Music", avatar: "Fast_Food_Music", theme: "Интернет-СМИ", subcribersCount: "701 413"),
        Community(name: "Андеграунд Бурятии", avatar: "Андеграунд_Бурятии", theme: "Юмор", subcribersCount: "74 793"),
        Community(name: "Гранит Науки (КБ-3)", avatar: "Гранит_Науки", theme: "Образование", subcribersCount: "596"),
        Community(name: "Fast Food Music", avatar: "Fast_Food_Music", theme: "Интернет-СМИ", subcribersCount: "701 413"),
        Community(name: "Андеграунд Бурятии", avatar: "Андеграунд_Бурятии", theme: "Юмор", subcribersCount: "74 793"),
        Community(name: "Гранит Науки (КБ-3)", avatar: "Гранит_Науки", theme: "Образование", subcribersCount: "596")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UserCommunityTableViewCell.self, forCellReuseIdentifier: UserCommunityTableViewCell.identifier)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Сообщества"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAvailableGroup(_ :)))
        navigationController?.navigationBar.isTranslucent = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: UserCommunityTableViewCell.identifier
        ) as! UserCommunityTableViewCell
        cell.configure(with: groups[indexPath.row].name, description: groups[indexPath.row].theme + ", " + groups[indexPath.row].subcribersCount, avatar: groups[indexPath.row].avatar)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
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
