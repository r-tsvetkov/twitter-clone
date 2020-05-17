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
        let controllersConfig: [(UIViewController, String)] = [
            (controller: FeedViewController(), imageId: "home_unselected"),
            (controller: ExploreController(), imageId: "search_unselected"),
            (controller: NotificationController(), imageId: "like_unselected"),
            (controller: ConversationsController(), imageId: "ic_mail_outline_white_2x-1"),
        ]

        viewControllers = controllersConfig.map { controller in
            return templateNavigationController(controller: controller.0, image: controller.1)
        }
    }

    func templateNavigationController(controller: UIViewController, image: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.tabBarItem.image = UIImage(named: image)
        navigationController.navigationBar.barTintColor = .white

        return navigationController
    }
}
