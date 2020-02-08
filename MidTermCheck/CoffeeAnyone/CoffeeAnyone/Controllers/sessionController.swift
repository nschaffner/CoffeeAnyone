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
    @Published var messages: [ChatMessage] = []
    var msgkey: String?
    var msgDict = [String:AnyObject]()
    init(){
        self.msgDict = [String:AnyObject]()
    }
    
    func messageSender(fromUser:String, toUser:String, text:String,newConvo:Bool) {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        K.refs.databaseUsers.child(fromUser).child("conversations").child(toUser).child("conversationId").observeSingleEvent(of: .value, with: {(snapshot) in
            let val = snapshot.value as? NSDictionary
            let convoKey = val!.allKeys[0]
            guard let key = K.refs.databaseChats.child(convoKey as! String).child("text").childByAutoId().key else{return}
            let post = ["text": text,
                        "senderId":fromUser,
                        "createdAt":date,
                        "timestamp":[".sv":"timestamp"]] as [String : Any]
            let childUpdates = ["\(key)/":post]
            K.refs.databaseChats.child(convoKey as! String).child("text").updateChildValues(childUpdates)
            if newConvo{
                K.refs.databaseUsers.child(toUser).child("conversations").child(fromUser).child("conversationId").child("\(convoKey)").setValue(fromUser)
            }
        })
    }
    
    func sendMessage(text:String){
        let ref = K.refs.databaseUsers
        let userID = "Fred"
        let love = "Eric"
        ref.child(userID).child("conversations").observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            if value?[love] != nil{
                self.messageSender(fromUser: userID, toUser: love, text: text,newConvo:false)
            }
            else{
                ref.child(userID).child("conversations").child(love).child("conversationId").childByAutoId().setValue(love)
                self.messageSender(fromUser: userID, toUser: love, text: text, newConvo: true)
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
    
    func receiveMessage(user:String){
        let convoId = K.refs.databaseUsers.child(user).child("conversations").child("Fred").child("conversationId")
        convoId.observeSingleEvent(of: .value, with: { (snapshot) in
          let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            for (key,_) in postDict{
                self.didFetchData(data: key)
            }}
        )
    }

    func didFetchData(data:String){
        self.msgkey = data
        loadMessages(convoKey: self.msgkey!)
        print(data)
    }

    func getData(msgs:[String:AnyObject])->[ChatMessage]{
        var conversationData:[ChatMessage] = []
        for (_,value) in msgs{
            let chatStruct = ChatMessage(
                    text:"\(value["text"]as! String)",
                    createdAt: "\(value["createdAt"] as! String)",
                    isMe: true, timestamp:value["timestamp"] as! Int,
                    senderId: "\(value["senderId"]as! String)"
            )
            conversationData.append(chatStruct)
        }
        conversationData.sort{$0.timestamp < $1.timestamp}
        print("newMsgs", conversationData)
        return conversationData
    }
    
    func loadMessages(convoKey:String){
        let message = K.refs.databaseChats.child(convoKey).queryOrdered(byChild: "timestamp")
        _ = message.observe(DataEventType.value, with: { (snapshot) in
            var messageData : [[String:AnyObject]] = []
            for child in snapshot.children{
                 let child = child as! DataSnapshot
                 if let childVal = child.value as? [String: AnyObject] {
                     messageData.append(childVal)
                    let cleanData = self.getData(msgs: messageData[0])
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
    
    func loadMsgToView(){
        receiveMessage(user:"Eric")
    }
}
