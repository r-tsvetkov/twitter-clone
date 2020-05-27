//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Роман Цветков on 26.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var tweet: Tweet? {
        didSet {
            configure()
        }
    }
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.setDimensions(width: 48, height: 48)
        imageView.layer.cornerRadius = 48 / 2
        imageView.backgroundColor = .twitterBlue
        
        return imageView
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        label.text = "Caption Label"
        
        return label
    }()
    
    private let infoLabel = UILabel()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var reetwetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "retweet"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var sharedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "share"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(
            top: topAnchor,
            left: leftAnchor,
            paddingTop: 8,
            paddingLeft: 8
        )
        
        let stackVew = UIStackView(arrangedSubviews: [infoLabel, captionLabel])
        stackVew.axis = .vertical
        stackVew.distribution = .fillProportionally
        stackVew.spacing = 4
        
        addSubview(stackVew)
        stackVew.anchor(
            top: profileImageView.topAnchor,
            left: profileImageView.rightAnchor,
            right: rightAnchor,
            paddingLeft: 12,
            paddingRight: 12
        )
        
        infoLabel.text = "Roman Tsvetkov @tsvetkovrb"
        infoLabel.font = UIFont.systemFont(ofSize: 14 )
        
        let underlineView = UIView()
        underlineView.backgroundColor = .systemGroupedBackground
        addSubview(underlineView)
        underlineView.anchor(
            top: topAnchor,
            left: leftAnchor,
            right: rightAnchor,
            height: 1
        )
        
        let buttonsStack = UIStackView(arrangedSubviews: [commentButton, reetwetButton, likeButton, sharedButton])
        buttonsStack.spacing = 72
        buttonsStack.axis = .horizontal
        
        addSubview(buttonsStack)
        buttonsStack.centerX(inView: self)
        buttonsStack.anchor(
            bottom: bottomAnchor,
            paddingBottom: 8
        )
    }
    
    required init?(coder: NSCoder) { 
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleClick() {
        print("Tapped")
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let tweet = self.tweet else { return }
        let viewModel = TweetVewModel(tweet: tweet)
        
        captionLabel.text = tweet.caption
        profileImageView.sd_setImage(with: viewModel.profileImageUrl, completed: nil)
        infoLabel.attributedText = viewModel.userInfoText
    }
}

