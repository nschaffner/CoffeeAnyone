//
//  ChatView.swift
//  chatView
//
//  Created by Eric Armstrong on 1/24/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//

import SwiftUI

struct ChatNav: View {
    @EnvironmentObject var fb: FirebaseSession
    
    var body: some View {
    NavigationView{
        List(fb.Contacts, id: \.self) { user in
        NavigationLink(
        destination:ChatView(contactName:user)){
      Text(user)
        }
        .navigationBarTitle("Users")
        }.onAppear(perform:fb.getConversations)
      }
    }
}

struct ChatRow:View{
    @EnvironmentObject var fb: FirebaseSession
    var chatMessage: ChatMessage
    var contact:String
    var body: some View{
        Group {
            if (chatMessage.senderId as String == contact) {
                HStack {
                    Group{
                        Text(chatMessage.senderId)
                        Text(chatMessage.text)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color.red)
                            .cornerRadius(10)
                            .contextMenu {
                                Button(action:DeleteMessage) {
                                    Text("Remove")
                                    Image(systemName: "trash")
                                }
                            }
                    }
                }
            }
            else{
                HStack{
                    Group{
                        Spacer()
                        Text(chatMessage.text)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color.green)
                            .cornerRadius(10)
                            .contextMenu{
                                Button(action:DeleteMessage) {
                                    Text("Remove")
                                    Image(systemName: "trash")
                                }
                        }
                        Text(chatMessage.senderId )
                    }
                    
                    
                }
            }
        }
    }
    func DeleteMessage(){
        fb.deleteMessage(messageId:chatMessage.messageId, convoId:chatMessage.conversationId)
    }
}

struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var composedMessage: String = ""
    @EnvironmentObject var fb: FirebaseSession
    
    var contactName:String
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Text("Go back")
            }
        }
    }
    
    var body: some View {
        VStack {
            Text(contactName)
            List {
                ForEach(fb.Messages, id:\.self){msg in
                    ChatRow(chatMessage: msg, contact:self.contactName)
                }
                EmptyView()
            }.onAppear(perform: {self.fb.loadMsgToView(contactName:self.contactName)})
            HStack{
                TextField("Message...", text: $composedMessage).frame(minHeight: CGFloat(30))
                Button(action:SendMessage){
                    Text("Send")
                }
            }.frame(minHeight: CGFloat(50)).padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
    
    func SendMessage(){
        fb.sendMessage(text:composedMessage, match:contactName)
        composedMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(contactName:"Eric")
    }
}
