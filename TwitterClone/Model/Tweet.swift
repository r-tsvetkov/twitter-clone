//
// Created by Роман Цветков on 26.05.2020.
// Copyright (c) 2020 Roman Tsvetkov. All rights reserved.
//

import Foundation

struct Tweet {
    let caption: String
    let tweetId: String
    let uid: String
    let likes: Int
    var timestamp: Date!
    let retweetCount: Int
    let user: User

    init(user: User, tweetId: String, tweetData: [String: Any]) {
        self.tweetId = tweetId

        self.caption = tweetData["caption"] as? String ?? ""
        self.uid = tweetData["uid"] as? String ?? ""
        self.likes = tweetData["likes"] as? Int ?? 0
        self.retweetCount = tweetData["reetwets"] as? Int ?? 0
        self.user = user

        if let timestamp = tweetData["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
    }
}
