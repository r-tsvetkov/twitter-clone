//
// Created by Роман Цветков on 17.05.2020.
// Copyright (c) 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit
import SDWebImage

class FeedViewController: UIViewController {
    
    var user: User? {
        didSet {
            configureLeftBarButton()
        }
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    func configureLeftBarButton() {
        let profileImageView = UIImageView()
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.sd_setImage(with: user?.imageUrl, completed: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}
