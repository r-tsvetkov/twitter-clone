//
//  TweetHeader.swift
//  TwitterClone
//
//  Created by Роман Цветков on 04.06.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

class TweetHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.setDimensions(width: 40, height: 40)
        imageView.layer.cornerRadius = 40 / 2
        imageView.backgroundColor = .twitterBlue
        
        return imageView
    }()
    
    private let fullName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Lorem ipsum"
        
        return label
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "Lorem ipsum"
        
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "Random text"
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "06:00 at 20/20/20"
        
        return label
    }()
    
    private lazy var optionsButton: UIButton = {
        let button = UIButton()
        button.tintColor = .lightGray
        button.setImage(UIImage(named: "down_arrow_24pt"), for: .normal)
        button.addTarget(self, action: #selector(optionsButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var retweetsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "2 retweets"
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "0 likes"
        return label
    }()
    
    private lazy var statsView: UIView = {
        let view = UIView()
        
        let dividerTop = UIView()
        dividerTop.backgroundColor = .systemGroupedBackground
        view.addSubview(dividerTop)
        dividerTop.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingLeft: 8,
            height: 1
        )
        
        let stack = UIStackView(arrangedSubviews: [retweetsLabel, likesLabel])
        stack.axis = .horizontal
        stack.spacing = 12
        
        view.addSubview(stack)
        stack.centerY(inView: view)
        stack.anchor(left: view.leftAnchor, paddingLeft: 16)
        
        let dividerBottom = UIView()
        dividerBottom.backgroundColor = .systemGroupedBackground
        view.addSubview(dividerBottom)
        dividerBottom.anchor(
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            paddingLeft: 8,
            height: 1
        )
        
        return view
    }()
    
    // MARK: - Lifecycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelStack = UIStackView(arrangedSubviews: [fullName, userName])
        labelStack.axis = .vertical
        labelStack.spacing = -6
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, labelStack])
        stack.spacing = 12
        
        addSubview(stack)
        stack.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 16)
        
        addSubview(captionLabel)
        captionLabel.anchor(
            top: stack.bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingTop: 20,
            paddingLeft: 16,
            paddingRight: 16
        )
        
        addSubview(dateLabel)
        dateLabel.anchor(
            top: captionLabel.bottomAnchor,
            left: leftAnchor,
            paddingTop: 20,
            paddingLeft: 16
        )
        
        addSubview(optionsButton)
        optionsButton.centerY(inView: stack)
        optionsButton.anchor(right: rightAnchor, paddingRight: 8)
        
        addSubview(statsView)
        statsView.anchor(
            top: dateLabel.bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingTop: 20,
            height: 40
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    // MARK: - Selectors
    
    @objc func optionsButtonTapped() {
        
    }
}
