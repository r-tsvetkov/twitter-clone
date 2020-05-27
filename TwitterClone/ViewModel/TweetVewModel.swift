//
//  TweetVewModel.swift
//  TwitterClone
//
//  Created by Роман Цветков on 27.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

struct TweetVewModel {
    
    // MARK: - Properties
    let tweet: Tweet
    let user: User
    
    var profileImageUrl: URL? {
        return user.imageUrl
    }
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .month, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        
        return formatter.string(from: tweet.timestamp, to: now) ?? "0m"
    }
    
    var userInfoText: NSAttributedString {
        let title = NSMutableAttributedString(string: user.fullName, attributes: [
            .font: UIFont.boldSystemFont(ofSize: 14)
        ])
        
        title.append(NSAttributedString(string: " @\(user.userName)", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.lightGray
        ]))
        
        title.append(NSAttributedString(string: " ﹒ \(timestamp)", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.lightGray
        ]))
        
        return title
    }
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
}
