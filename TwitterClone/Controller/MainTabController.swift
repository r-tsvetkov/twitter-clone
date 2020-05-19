//
// Created by Роман Цветков on 17.05.2020.
// Copyright (c) 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {

    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers()
        configureUI()
    }

    // MARK: - Selectors
    @objc func buttonTapped() {
        print("123")
    }

    // MARK: - Helpers
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(
                bottom: view.safeAreaLayoutGuide.bottomAnchor,
                right: view.rightAnchor,
                paddingBottom: 64,
                paddingRight: 14,
                width: 56,
                height: 56
        )
        actionButton.layer.cornerRadius = 56 / 2
    }

    func configureViewControllers() {
        let controllersConfig: [(UIViewController, String)] = [
            (controller: FeedViewController(), imageId: "home_unselected"),
            (controller: ExploreController(), imageId: "search_unselected"),
            (controller: NotificationController(), imageId: "like_unselected"),
            (controller: ConversationsController(), imageId: "ic_mail_outline_white_2x-1"),
        ]

        viewControllers = controllersConfig.map { (controller, image) in
            templateNavigationController(controller, image)
        }
    }

    func templateNavigationController(_ controller: UIViewController, _ image: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.tabBarItem.image = UIImage(named: image)
        navigationController.navigationBar.barTintColor = .white

        return navigationController
    }
}
