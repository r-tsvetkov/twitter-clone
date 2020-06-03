//
//  ProfileHeader.swift
//  TwitterClone
//
//  Created by Роман Цветков on 28.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

protocol ProfileHeaderDelegate: class {
    func handleDissmissal()
    func handleEditProfile(_ header: ProfileHeader)
}

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    var user: User? {
        didSet {
            configureUI()
        }
    }
    
    weak var delegate: ProfileHeaderDelegate?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue
        view.addSubview(backArrow)
        backArrow.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            paddingTop: 42,
            paddingLeft: 16
        )
        backArrow.setDimensions(width: 30, height: 30)
        
        return view
    }()
    
    private lazy var backArrow: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_white_24dp").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleTapBackButton), for: .touchUpInside)
        
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 4
        
        return imageView
    }()
    
    lazy var editOrFollowProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Loading", for: .normal)
        button.layer.borderColor = UIColor.twitterBlue.cgColor
        button.layer.borderWidth = 1.25
        button.setTitleColor(.twitterBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(editOrFollowButtonTapped), for:.touchUpInside)
        
        return button
    }()
    
    private let fullName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .lightGray
        
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 3
        label.text = "I'm a software developer from Saint Petersburg"
        
        return label
    }()
    
    private let filterBar = ProfileFilterView()
    
    private let underlineView: UIView = {
        let veiw = UIView()
        veiw.backgroundColor = .twitterBlue
        
        return veiw
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        let tap = UIGestureRecognizer(target: self, action: #selector(handleFollowingTapped))
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        let tap = UIGestureRecognizer(target: self, action: #selector(handleFollowresTapped))
        label.addGestureRecognizer(tap)
        
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        filterBar.delegate = self
        
        addSubview(containerView)
        containerView.anchor(
            top: topAnchor,
            left: leftAnchor,
            right: rightAnchor,
            height: 108
        )
        
        addSubview(profileImageView)
        profileImageView.anchor(
            top: containerView.bottomAnchor,
            left: leftAnchor,
            paddingTop: -24,
            paddingLeft: 8
        )
        profileImageView.setDimensions(width: 80, height: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        
        addSubview(editOrFollowProfileButton)
        editOrFollowProfileButton.anchor(
            top: containerView.bottomAnchor,
            right: rightAnchor,
            paddingTop: 12,
            paddingRight: 12
        )
        editOrFollowProfileButton.setDimensions(width: 100, height: 36)
        editOrFollowProfileButton.layer.cornerRadius = 36 / 2
        
        let userDetailsStack = UIStackView(arrangedSubviews: [
            fullName,
            userName,
            bioLabel
        ])
        
        userDetailsStack.axis = .vertical
        userDetailsStack.distribution = .fillProportionally
        userDetailsStack.spacing = 4
        addSubview(userDetailsStack)
        userDetailsStack.anchor(
            top: profileImageView.bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingTop: 8,
            paddingLeft: 12,
            paddingRight: 12
        )
        
        addSubview(filterBar)
        filterBar.anchor(
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            height: 50
        )
        
        addSubview(underlineView)
        underlineView.anchor(
            left: leftAnchor,
            bottom: bottomAnchor,
            width: frame.width / 3,
            height: 2
        )
        
        let followStack = UIStackView(arrangedSubviews: [followingLabel, followersLabel])
        followStack.axis = .horizontal
        followStack.spacing = 8
        followStack.distribution = .fillEqually
        
        addSubview(followStack)
        followStack.anchor(
            top: userDetailsStack.bottomAnchor,
            left: leftAnchor,
            paddingTop: 8,
            paddingLeft: 12,
            paddingRight: 12
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleTapBackButton() {
        delegate?.handleDissmissal()
    }
    
    @objc private func editOrFollowButtonTapped() {
        delegate?.handleEditProfile(self)
    }
    
    @objc private func handleFollowingTapped() {
        
    }
    
    @objc private func handleFollowresTapped() {
        
    }

    // MARK: - Helpers
    
    func configureUI() {
        guard let user = self.user else { return }
        let viewModel = ProfileHeaderViewModel(user: user)
        
        profileImageView.sd_setImage(with: user.imageUrl)
        editOrFollowProfileButton.setTitle(viewModel.actionButtonTitle, for: .normal)
        fullName.text = user.fullName
        userName.text = viewModel.userName
        followingLabel.attributedText = viewModel.followingString
        followersLabel.attributedText = viewModel.followersString
    }
}

// MARK: - ProfileFilterViewDelegate

extension ProfileHeader: ProfileFilterViewDelegate {
    func filterView(_ view: ProfileFilterView, didSelect indexPath: IndexPath) {
        guard let cell = view.collectionView.cellForItem(at: indexPath) as? ProfileFilterCell else { return }
        
        let xPosition = cell.frame.origin.x
        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = xPosition
        }
    }
}
