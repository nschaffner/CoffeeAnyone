//
//  ChatController.swift
//  chatView
//
//  Created by Eric Armstrong on 1/24/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//

import Combine
import SwiftUI

class ChatController: ObservableObject{
    var didChange = PassthroughSubject<Void, Never>()
    
    
//    @Published var messages = [
//        ChatMessage(message: "Hey Baby", createdAt: "Time",  isMe:false),
//        ChatMessage(message: "Blocked", createdAt: "Time",  isMe: true)
//
//    ]
    
//    func sendMessage(_ chatMessage: ChatMessage){
//        messages.append(chatMessage)
//        didChange.send(())
//    }
}
