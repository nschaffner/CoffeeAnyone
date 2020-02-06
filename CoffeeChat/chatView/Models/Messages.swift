//
//  Messages.swift
//  chatView
//
//  Created by Eric Armstrong on 1/24/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//

import SwiftUI
import FirebaseDatabase

struct Messages:Identifiable{
    let ref: DatabaseReference?
    let id: String
    let text: String
    let createdAt: String
    let senderId: String
    let key: String?
    
    init(message: String, key: String = "", created:String, senderId:String){
        self.ref = nil
        self.text = message
        self.key = key
        self.id = key
        self.createdAt = created
        self.senderId = senderId
    }
    
    
    init?(snapshot: DataSnapshot){
        guard
            let value = snapshot.value as? [String:AnyObject],
            let message = value["message"] as? String,
            let created = value["created"] as? String,
            let senderId = value["senderId"] as? String
            else{
                return nil
            }
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.text = message
        self.createdAt = created
        self.senderId = senderId
        self.id = snapshot.key

        
    }
    
    func toAnyObject() -> Any{
        return[
            "message":text,
            "created":createdAt,
            "senderId":senderId
        ]
    }
}

//struct User:Codable:
//{
//    var firstName:
//}



