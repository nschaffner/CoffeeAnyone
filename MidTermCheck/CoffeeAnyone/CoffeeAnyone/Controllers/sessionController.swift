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
    @Published var session: User?
    @Published var items: [Messages] = []
    @Published var messages: [ChatMessage] = []
    var msgkey: String?
    var msgDict = [String:AnyObject]()
    init(){
        self.msgDict = [String:AnyObject]()
    }
    
    func messageSender(fromUser:String, toUser:String, message:String,newConvo:Bool) {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        K.refs.databaseUsers.child(fromUser).child("conversations").child(toUser).child("conversationId").observeSingleEvent(of: .value, with: {(snapshot) in
            let val = snapshot.value as? NSDictionary
            let convoKey = val!.allKeys[0]
            guard let key = K.refs.databaseChats.child(convoKey as! String).child("messages").childByAutoId().key else{return}
            let post = ["text": message,
                        "senderId":fromUser,
                        "createdAt":date,
                        "timestamp":[".sv":"timestamp"]] as [String : Any]
            let childUpdates = ["\(key)/":post]
            K.refs.databaseChats.child(convoKey as! String).child("messages").updateChildValues(childUpdates)
            if newConvo{
                K.refs.databaseUsers.child(toUser).child("conversations").child(fromUser).child("conversationId").child("\(convoKey)").setValue(fromUser)
            }
        })
    }
    
    func sendMessage(message:String){
        let ref = K.refs.databaseUsers
        let userID = "Fred"
        let love = "Eric"
        ref.child(userID).child("conversations").observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            if value?[love] != nil{
                print("love found")
                self.messageSender(fromUser: userID, toUser: love, message: message,newConvo:false)
            }
            else{
                ref.child(userID).child("conversations").child(love).child("conversationId").childByAutoId().setValue(love)
                self.messageSender(fromUser: userID, toUser: love, message: message, newConvo: true)
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
    
    func receiveMessage(user:String) -> [[String:AnyObject]]{
        let messageArray: [[String:AnyObject]] = []
        let convoId = K.refs.databaseUsers.child(user).child("conversations").child("Fred").child("conversationId")
        convoId.observeSingleEvent(of: .value, with: { (snapshot) in
          let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            for (key,_) in postDict{
                self.didFetchData(data: key)
            }}
        )
        return messageArray
        }

    func didFetchData(data:String){
        self.msgkey = data
        loadMessages(convoKey: self.msgkey!)
    }

    func gotData(msgs:[String:AnyObject])->[ChatMessage]{
        var newMsgs:[ChatMessage] = []
        for (_,v) in msgs{
            let chatStruct = ChatMessage(
                    message:"\(v["text"]as! String)",
                    createdAt: "\(v["createdAt"] as! String)",
                    isMe: true, timestamp:v["timestamp"] as! Int,
                    senderId: "\(v["senderId"]as! String)"
            )
            newMsgs.append(chatStruct)
        }
        newMsgs.sort{$0.timestamp < $1.timestamp}
        print(newMsgs)
        return newMsgs
    }
    
    func loadMessages(convoKey:String){
        let message = K.refs.databaseChats.child(convoKey).queryOrdered(byChild: "timestamp")
        _ = message.observe(DataEventType.value, with: { (snapshot) in
            var messageData : [[String:AnyObject]] = []
            for child in snapshot.children{
                 let child = child as! DataSnapshot
                 if let childVal = child.value as? [String: AnyObject] {
                     messageData.append(childVal)
                    let cleanData = self.gotData(msgs: messageData[0])
                    self.messages = cleanData
                 }
                 else{
                     print("no data sent")
                 }
             }
        })
    }
    
    func getMsgKey(messageKey:String){
        self.msgkey = messageKey
    }

    func loadMsg(){
        print(receiveMessage(user:"Eric"))
    }
}
