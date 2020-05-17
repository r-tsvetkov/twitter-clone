//
// Created by Роман Цветков on 17.05.2020.
// Copyright (c) 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers()
    }

    // MARK: - Helpers

    func configureViewControllers() {
        let feed = FeedViewController()
        feed.tabBarItem.image = UIImage(named: "home_unselected")

        let explore = ExploreController()
        explore.tabBarItem.image = UIImage(named: "search_unselected")

        let conversations = ConversationsController()
        conversations.tabBarItem.image = UIImage(named: "like_unselected")

        let notifications = NotificationController()
        notifications.tabBarItem.image = UIImage(named: "home_unselected")

        viewControllers = [feed, explore, notifications, conversations]
    }
}
