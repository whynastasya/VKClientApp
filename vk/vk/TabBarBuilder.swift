//
//  TabBarBuilder.swift
//  vk
//
//  Created by nastasya on 29.06.2023.
//

import Foundation
import UIKit

final class TabBarBuilder {
    static func createTabBarController() -> UITabBarController {
        let newsFeedViewController = UINavigationController(rootViewController: NewsFeedTableViewController())
        newsFeedViewController.tabBarItem.image = UIImage(systemName: "house")

        let groupsViewController = UINavigationController(rootViewController: CommunitiesTableViewController())
        groupsViewController.tabBarItem.image = UIImage(systemName: "squareshape.split.2x2")
        
        let messengerViewController = UINavigationController(rootViewController: MessengerViewController())
        messengerViewController.tabBarItem.image = UIImage(systemName: "message")
        
        let friendsViewController = UINavigationController(rootViewController: FriendsTableViewController())
        friendsViewController.tabBarItem.image = UIImage(systemName: "person.2")
        
        let userViewController = UINavigationController(rootViewController: UserViewController())
        userViewController.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .vkWhite
        tabBarController.tabBar.unselectedItemTintColor = .vkGray
        tabBarController.tabBar.backgroundColor = .vkBlack
        tabBarController.tabBar.isTranslucent = false
        tabBarController.setViewControllers([newsFeedViewController, groupsViewController, messengerViewController, friendsViewController, userViewController], animated: true)
        
        return tabBarController
    }
}
