//
//  ProfileFilterCell.swift
//  TwitterClone
//
//  Created by Роман Цветков on 29.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

class ProfileFilterCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var option: ProfileFilterOptions! {
        didSet {
            titleLabel.text = option.description
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Text filter"
        
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            titleLabel.font = isSelected ?
                UIFont.systemFont(ofSize: 16) :
                UIFont.systemFont(ofSize: 14)
            titleLabel.textColor = isSelected ?
                .twitterBlue :
                .lightGray
        }
    }
    
    // MARK: - Lifecycles
    
    // MARK: - Helpers
    
    // MARK: - Selectors
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(titleLabel)
        titleLabel.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
