//
//  FirebaseSession.swift
//  chatView
//
//  Created by Eric Armstrong on 1/24/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//

import SwiftUI
import FirebaseDatabase

protocol MyDelegate{
    func didFetchData(data:String)
    func gotData(msgs:[String:AnyObject])
}

class FirebaseSession: ObservableObject{
    @Published var Messages: [ChatMessage] = []
    @Published var UserName: String?
    @Published var Contacts:[String]
    @Published var CurrentUser: User?
    
    var convoId: String?
    var messageDictionary = [String:AnyObject]()
    init(){
        self.Contacts = []
        self.messageDictionary = [String:AnyObject]()
        self.CurrentUser = User(userDetails: ["uid":"1234", "email":"fake@gmail.com", "userName":"Eric", "conversationIds":"Ids"])
        self.UserName = CurrentUser?.userName
    }
    
    func getConversations(){
        let userConversations = K.refs.databaseUsers.child(self.UserName!).child("conversations").queryOrderedByKey()
        _ = userConversations.observe(DataEventType.value, with: {(snapshot) in
            var conversationData : [String] = []
            for child in snapshot.children{
                let child = child as! DataSnapshot
                if let _ = child.value {
                    conversationData.append(child.key)
                }
                else{
                    print("no data sent")
                }
                self.Contacts = conversationData
            }
        })
    }
    
    func messageSender(fromUser:String, toUser:String, text:String,isNewConversation:Bool) {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        K.refs.databaseUsers.child(fromUser).child("conversations").child(toUser).child("conversationId").observeSingleEvent(of: .value, with: {(snapshot) in
            let val = snapshot.value as? NSDictionary
            let conversationID = val!.allKeys[0]
            guard let key = K.refs.databaseChats.child(conversationID as! String).child("text").childByAutoId().key else{return}
            let post = ["text": text,
                        "senderId":fromUser,
                        "createdAt":date,
                        "timestamp":[".sv":"timestamp"]] as [String : Any]
            let childUpdates = ["\(key)/":post]
            K.refs.databaseChats.child(conversationID as! String).child("text").updateChildValues(childUpdates)
            if isNewConversation{
                K.refs.databaseUsers.child(toUser).child("conversations").child(fromUser).child("conversationId").child("\(conversationID)").setValue(fromUser)
            }
        })
    }
    
    func sendMessage(text:String, match:String){
        let ref = K.refs.databaseUsers
        let userName = UserName!
        let matchName = match
        ref.child(userName).child("conversations").observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            if value?[matchName] != nil{
                self.messageSender(fromUser: userName, toUser: matchName, text: text,isNewConversation:false)
            }
            else{
                ref.child(userName).child("conversations").child(matchName).child("conversationId").childByAutoId().setValue(matchName)
                self.messageSender(fromUser: userName, toUser: matchName, text: text, isNewConversation: true)
            }
        })
    }
    
    func convertTimestamp(serverTimestamp: Double) -> String {
        let x = serverTimestamp / 1000
        let date = NSDate(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter.string(from: date as Date)
    }
    
    func receiveMessage(contact:String){
        let conversationId = K.refs.databaseUsers.child(self.UserName!).child("conversations").child(contact).child("conversationId").queryOrderedByKey()
        print(conversationId)
        conversationId.observe(.value, with: { (snapshot) in
            let messageDictionary = snapshot.value as? [String : AnyObject] ?? [:]
            if messageDictionary.count <= 0{
                self.Messages = []
            }
            else{
                for (key,_) in messageDictionary{
                    self.renderMessages(conversationId: key)
                }}
        })
    }
    // Necessary work around for SwiftUI...for now
    func renderMessages(conversationId:String){
        self.convoId = conversationId
        loadMessages(conversationId: self.convoId!)
    }
    
    func loadMessages(conversationId:String){
        let message = K.refs.databaseChats.child(conversationId).queryOrdered(byChild: "timestamp")
        _ = message.observe(DataEventType.value, with: { (snapshot) in
            var messageData : [[String:AnyObject]] = []
            for child in snapshot.children{
                let child = child as! DataSnapshot
                if let childVal = child.value as? [String: AnyObject] {
                    messageData.append(childVal)
                    let cleanData = self.formatMessages(msgs: messageData[0], convoId: conversationId)
                    self.Messages = cleanData
                }
                else{
                    print("no data sent")
                }
            }
        })
    }
    
    func loadMessages(convoKey:String){
        let message = K.refs.databaseChats.child(convoKey).queryOrdered(byChild: "timestamp")
        _ = message.observe(DataEventType.value, with: { (snapshot) in
            var messageData : [[String:AnyObject]] = []
            for child in snapshot.children{
                let child = child as! DataSnapshot
                if let childVal = child.value as? [String: AnyObject] {
                    messageData.append(childVal)
                    let cleanData = self.formatMessages(msgs: messageData[0], convoId: convoKey)
                    self.Messages = cleanData
                }
                else{
                    print("no data sent")
                }
            }
        })
    }
    
    func formatMessages(msgs:[String:AnyObject], convoId:String)->[ChatMessage]{
        var conversationData:[ChatMessage] = []
        for (key,value) in msgs{
            let chatStruct = ChatMessage(
                text:"\(value["text"]as! String)",
                createdAt: "\(value["createdAt"] as! String)",
                isMe: true, timestamp:value["timestamp"] as! Int,
                senderId: "\(value["senderId"]as! String)",
                messageId: key as String,
                conversationId: convoId as String
            )
            conversationData.append(chatStruct)
        }
        conversationData.sort{$0.timestamp < $1.timestamp}
        return conversationData
    }
    
    func getMsgKey(messageKey:String){
        self.convoId = messageKey
    }
    
    func loadMsgToView(contactName:String){
        receiveMessage(contact:contactName)
    }
    
    func deleteMessage(messageId:String, convoId:String){
        K.refs.databaseChats.child(convoId).child("text").child(messageId).removeValue()
    }
}
