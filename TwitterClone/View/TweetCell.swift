//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Роман Цветков on 26.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) { 
        fatalError("init(coder:) has not been implemented")
    }
}
