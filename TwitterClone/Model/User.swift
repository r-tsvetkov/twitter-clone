//
//  UserModel.swift
//  TwitterClone
//
//  Created by Роман Цветков on 24.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import Foundation
import Firebase

struct User {
    let fullName: String
    var imageUrl: URL?
    let email: String
    let userName: String
    let uid: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == uid
    }
    
    init(uid: String, userData: [String: AnyObject]) {
        self.uid = uid
        self.fullName = userData["fullName"] as? String ?? ""
        self.email = userData["email"] as? String ?? ""
        self.userName = userData["userName"] as? String ?? ""
        
        guard let imageUrl = userData["profileImageUrl"] as? String else { return }
        self.imageUrl = URL(string: imageUrl)
    }
}
