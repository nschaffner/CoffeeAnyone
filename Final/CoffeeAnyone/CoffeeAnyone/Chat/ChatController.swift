//
//  FirebaseSession.swift
//  chatView
//
//  Created by Eric Armstrong on 1/24/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//

import SwiftUI
import FirebaseDatabase
import Combine

protocol MyDelegate{
    func didFetchData(data:String)
    func gotData(msgs:[String:AnyObject])
}

class FirebaseSession: ObservableObject{
    @Published var Messages: [ChatMessage] = []
    @Published var UserName: String?
    @Published var ContactNames:[String]
    @Published var CurrentUser: User?
    @Published var UserId:String?
    @Published var Contacts: [contactData]
    
    var convoId: String?
    var messageDictionary = [String:AnyObject]()
    init(){
        self.Contacts=[]
        self.ContactNames = []
        self.messageDictionary = [String:AnyObject]()
        self.CurrentUser = User(userDetails: ["uid":"\(UserDefaults.standard.string(forKey: "userid") ?? "")", "userName":"\(UserDefaults.standard.string(forKey: "name") ?? "")"])
        self.UserName = CurrentUser?.userName
        self.UserId = CurrentUser?.uid?.replacingOccurrences(of: ".", with: "%")
    }
    
    func getConversations(){
        self.Contacts = []
        let userId = " \(UserDefaults.standard.string(forKey: "userid") ?? "")".replacingOccurrences(of: ".", with: "%")
        let userConversations = K.refs.databaseUsers.child(userId)
        var contactStruct = contactData(username:"", userId:"", photourl:"")
        _ = userConversations.observe(DataEventType.value, with: {(snapshot) in
            var conversationData : [String] = []
            for child in snapshot.children{
                let child = child as! DataSnapshot
                if let val = child.value as? [String:Any] {
                    for childValue in val{
                        let matchkey = childValue.key
                        let convoId = childValue.value as! [String:Any]
                        let userConvoVar = convoId["conversationId"] as! [String:Any]
                        for values in userConvoVar{
                            if values.key == "photo_url"{
                                contactStruct.photourl=values.value as! String
                            }
                            else{
                            let matchName = values.value as! String
                            conversationData.append(matchName)
                            contactStruct.userId=matchkey
                                contactStruct.username=matchName}
                        }
                    }
                }
                else{
                    if child.key == "photo_url"{
                        contactStruct.photourl=child.value as! String
                    }
                }
            }
            self.Contacts.append(contactStruct)
            self.ContactNames = conversationData
        })
    }
    
    func messageSender(fromUser:String, fromUserName:String, toUser:String, text:String, toUserName:String, isNewConversation:Bool) {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        K.refs.databaseUsers.child(fromUser).child("conversations").child(toUser).child("conversationId").observeSingleEvent(of: .value, with: {(snapshot) in
            let val = snapshot.value as? NSDictionary
            var conversationID = ""
            for keys in val!.allKeys{
                if keys as! String != "photo_url"{
                    conversationID = keys as! String
                }
                
            }
            guard let key = K.refs.databaseChats.child(conversationID).child("text").childByAutoId().key else{return}
            let post = ["text": text,
                        "senderId":fromUser,
                        "senderName":fromUserName,
                        "createdAt":date,
                        "timestamp":[".sv":"timestamp"]] as [String : Any]
            let childUpdates = ["\(key)/":post]
            K.refs.databaseChats.child(conversationID).child("text").updateChildValues(childUpdates)
            if isNewConversation{
                K.refs.databaseUsers.child(toUser).child("conversations").child(fromUser).child("conversationId").child("\(conversationID)").setValue(fromUserName)
            }
        })
    }
    
    func sendMessage(text:String, match:String, contactId:String, photourl:String){
        let ref = K.refs.databaseUsers
        let userName = UserName!
        let userId = "\(UserDefaults.standard.string(forKey: "userid") ?? "")".replacingOccurrences(of: ".", with: "%")
        let matchName = match
        let contact = contactId.replacingOccurrences(of: ".", with: "%")
        ref.child(userId).child("conversations").observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            if value?[contact] != nil{
                self.messageSender(fromUser: userId, fromUserName:userName, toUser: contact, text: text, toUserName: matchName, isNewConversation:false)
            }
            else{
                ref.child(userId).child("conversations").child(contact).child("conversationId").childByAutoId().setValue(matchName)
                ref.child(userId).child("conversations").child(contact).child("conversationId").child("photo_url").setValue(photourl)
                self.messageSender(fromUser: userId, fromUserName:userName, toUser:contact, text: text, toUserName:matchName, isNewConversation: true)
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
        let userId = "\(UserDefaults.standard.string(forKey: "userid") ?? "")".replacingOccurrences(of: ".", with: "%")
        let conversationId = K.refs.databaseUsers.child(userId).child("conversations").child(contact).child("conversationId").queryOrderedByKey()
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
    
    func formatMessages(msgs:[String:AnyObject], convoId:String)->[ChatMessage]{
        var conversationData:[ChatMessage] = []
        for (key,value) in msgs{
            let chatStruct = ChatMessage(
                text:"\(value["text"]as! String)",
                createdAt: "\(value["createdAt"] as! String)",
                isMe: true, timestamp:value["timestamp"] as! Int,
                senderId: "\(value["senderId"]as! String)",
                senderName: "\(value["senderName"]as! String)",
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
    
    func loadMsgToView(contactid:String){
        let contact = contactid.replacingOccurrences(of: ".", with: "%")
        receiveMessage(contact:contact)
    }
    
    func deleteMessage(messageId:String, convoId:String){
        K.refs.databaseChats.child(convoId).child("text").child(messageId).removeValue()
    }
}




