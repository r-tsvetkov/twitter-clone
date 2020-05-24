//
//  UserService.swift
//  TwitterClone
//
//  Created by Роман Цветков on 24.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        print("ID:", uid)
        
        USERS_DB.child(uid).observeSingleEvent(of: .value, with: { snapshot in
            guard let userData = snapshot.value as? [String: AnyObject] else { return }
            let user = User(uid: uid, userData: userData)
            
            completion(user)
        })
    }
}
