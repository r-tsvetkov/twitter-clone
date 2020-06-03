//
//  ProfileHeaderViewModel.swift
//  TwitterClone
//
//  Created by Роман Цветков on 30.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
    case tweet
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweet:
            return "Tweets"
        case .replies:
            return "Tweets & replies"
        case .likes:
            return "Likes"
            
        }
    }
}

struct ProfileHeaderViewModel {
    
    private let user: User
    
    var followersString: NSAttributedString {
        return attributedText(withValue: user.stats?.followers ?? 0, text: " followers")
    }
    
    var followingString: NSAttributedString {
        return attributedText(withValue: user.stats?.following ?? 0, text: " following")
    }
    
    var actionButtonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        }
        
        if !user.isFollowed && !user.isCurrentUser {
            return "Follow"
        }
        
        if user.isFollowed {
            return "Following "
        }
        
        return "Loading"
    }
    
    var userName: String {
        return "@\(user.userName)"
    }
    
    init(user: User) {
        self.user = user
    }
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(
            string: "\(value)",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 14)
        ])
        
        attributedTitle.append(NSAttributedString(
            string: "\(text)",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        ))
        
        return attributedTitle
    }
}
