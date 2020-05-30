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
        let ref = REF_TWEETS.childByAutoId()
        ref.updateChildValues(values) { (error, dbRef) in
            guard let tweetID = ref.key else { return }
            
            REF_USER_TWEETS.child(uid).updateChildValues([tweetID: 1], withCompletionBlock: completion)
        }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        var tweets = [Tweet]()
        
        REF_TWEETS.observe(.childAdded) { (snapshot) in
            guard let tweetData = snapshot.value as? [String: Any] else { return }
            guard let uid = tweetData["uid"] as? String else { return }
            let tweetId = snapshot.key
            
            UserService.shared.fetchUser(uid: uid) { (user) in
                let tweet = Tweet(user: user, tweetId: tweetId, tweetData: tweetData)
                tweets.append(tweet)
                completion(tweets.reversed())
            }
        }
    }
    
    func fetchTewwts(forUser user: User, completion: @escaping([Tweet]) -> Void) {
        var tweets = [Tweet]()
        
        REF_USER_TWEETS.child(user.uid).observe(.childAdded) { snap in
            let tweetID = snap.key
            
            REF_TWEETS.child(tweetID).observeSingleEvent(of: .value) { snap in
                guard let tweetData = snap.value as? [String: Any] else { return }
                guard let uid = tweetData["uid"] as? String else { return }
                
                UserService.shared.fetchUser(uid: uid) { (user) in
                    let tweet = Tweet(user: user, tweetId: tweetID, tweetData: tweetData)
                    tweets.append(tweet)
                    completion(tweets.reversed())
                }
            }
        }
    }
}
