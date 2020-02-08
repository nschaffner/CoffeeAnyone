//
//  Members.swift
//  chatView
//
//  Created by Eric Armstrong on 1/24/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//

import Foundation

struct Conversation:Identifiable{
    let id: String
    let displayMessage: String
    let members: [String]
    let messages: [String]
    
    init(id: String, displayMessage: String, members:[String], messages:[String]) {
        self.id = id
        self.displayMessage = displayMessage
        self.members = members
        self.messages = messages
    }

}
