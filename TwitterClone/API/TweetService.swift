//
//  TweetService.swift
//  TwitterClone
//
//  Created by Роман Цветков on 25.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import Firebase

struct TweetService {
    static let shared = TweetService()
    
    func uploadTweet(caption: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let values = [
            "uid": uid,
            "timestamp": Int(Date().timeIntervalSince1970),
            "likes": 0,
            "reetwets": 0,
            "caption": caption
            ] as [String: Any]
        
        REF_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }
}

 
