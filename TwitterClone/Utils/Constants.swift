//
// Created by Роман Цветков on 23.05.2020.
// Copyright (c) 2020 Roman Tsvetkov. All rights reserved.
//

import Firebase

let REF_DB = Database.database().reference()
let REF_USERS = REF_DB.child("users")
let REF_TWEETS = REF_DB.child("tweets")
let REF_USER_TWEETS = REF_DB.child("user-tweets")

let REF_STORAGE = Storage.storage().reference()
let PROFILE_IMAGES_STORAGE = REF_STORAGE.child("profile_images")
