//
//  Users.swift
//  CoffeeAnyone
//
//  Created by Eric Armstrong on 2/8/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import Foundation

struct User{
    let uid: String?
    let email: String?
    let userName: String?
    let conversationIds: String?

    init(userDetails:Dictionary<String, Any>){
        uid = userDetails["id"] as? String
        email = userDetails["email"] as? String
        userName = userDetails["userName"] as? String
        conversationIds = userDetails["conversationIds"] as? String
    }
    
    func getUserName()->String{
        return self.userName!
    }
}
