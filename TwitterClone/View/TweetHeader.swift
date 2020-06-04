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
    
    // MARK: - Lifecycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    // MARK: - Selectors
}
