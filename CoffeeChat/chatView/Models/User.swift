//
//  User.swift
//  chatView
//
//  Created by Eric Armstrong on 1/24/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//

import Foundation



struct User{
    let uid: String?
    let email: String?
    let displayName: String?
    let conversationIds: String?

    

    init(dictionary:Dictionary<String, Any>){
        uid = dictionary["id"] as? String
        email = dictionary["email"] as? String
        displayName = dictionary["displayName"] as? String
        conversationIds = dictionary["conversationIds"] as? String
//
//    }
//    init(uid:String, displayName: String?, email: String?, conversationIds:[String]?){
//        self.uid = uid
//        self.email = email
//        self.displayName = displayName
//        self.conversationIds = conversationIds
//
//    }
}
}

