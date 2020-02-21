//
//  Constants.swift
//  chatView
//
//  Created by Eric Armstrong on 1/24/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//
import Firebase

struct K {
    static let userA = "Eric"
    static let userB = "Fred"
    static let convo = "cid"
    static let msg = "msgId"
    static let sender = "EricId"
    
    
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct refs{
        static let databaseRoot = Database.database().reference()
        static let databaseUsers = databaseRoot.child("users")
        static let databaseChats = databaseRoot.child("conversations")
        
        
        
        
        
    }
}
