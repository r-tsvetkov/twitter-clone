//
//  AuthService.swift
//  TwitterClone
//
//  Created by Роман Цветков on 23.05.2020.
//  Copyright © 2020 Roman Tsvetkov. All rights reserved.
//

import Firebase
import UIKit

struct AuthCredentials {
    let email: String
    let password: String
    let userName: String
    let fullName: String
    let profileImage: UIImage
}

struct AuthServece {
    static let shared = AuthServece()
    
    func registerUser(with credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        let email = credentials.email
        let password = credentials.password
        let userName = credentials.userName
        let fullName = credentials.fullName
        let profileImage = credentials.profileImage
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageRef = PROFILE_IMAGES_STORAGE.child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { (metaData, error) in
            storageRef.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("Error with creation user:", error.localizedDescription)
                    }
                    
                    guard let uid = result?.user.uid else {
                        return
                    }
                    let values = [
                        "email": email,
                        "password": password,
                        "fullName": fullName,
                        "userName": userName,
                        "profileImageUrl": profileImageUrl
                    ]
                    
                    USERS_DB.child(uid).updateChildValues(values, withCompletionBlock: completion)
                }
            }
        }
    }
}
