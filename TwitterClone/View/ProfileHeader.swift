//
//  ProfileHeader.swift
//  TwitterClone
//
//  Created by Роман Цветков on 28.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    private let filterBar = ProfileFilterView()
    
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
    
    private lazy var editOrFollowProfileButton: UIButton = {
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
        label.text = "Roman Tsvetkov"
        
        return label
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.text = "@tsvetkorb"
        
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 3
        label.text = "I'm a software developer from Saint Petersburg"
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleTapBackButton() {
        
    }
    
    @objc func editOrFollowButtonTapped() {
        
    }
}
