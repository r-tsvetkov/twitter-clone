//
// Created by Роман Цветков on 17.05.2020.
// Copyright (c) 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    var user: User? {
        didSet {
            guard let nav = viewControllers?.first as? UINavigationController else { return }
            guard let feed = nav.viewControllers.first as? FeedViewController else { return }
            
            feed.user = user
        }
    }
     
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
        view.backgroundColor = .twitterBlue
//        logOutUser()
        authenticateUserAndConfigureUI()
    }
    
    // MARK: - Selectors
    
    @objc func buttonTapped() {
        guard let user = user else { return }
        let controller = UploadTweetController(user: user)
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    // MARK: - API
    
    func authenticateUserAndConfigureUI() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let authFlow = UINavigationController(rootViewController: LoginController())
                authFlow.modalPresentationStyle = .fullScreen
                self.present(authFlow, animated: false, completion: nil)
            }
        } else {
            configureViewControllers()
            configureUI()
            fetchUser()
        }
    }
    
    func logOutUser() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("Logout user error \(error.localizedDescription)")
        }
    }
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        UserService.shared.fetchUser(uid: uid) { user in
            self.user = user
        }
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
            (controller: FeedViewController(collectionViewLayout: UICollectionViewFlowLayout()), imageId: "home_unselected"),
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
