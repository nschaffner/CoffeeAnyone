//
//  ChatView.swift
//  chatView
//
//  Created by Eric Armstrong on 1/24/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//

import SwiftUI

extension Color{
    static let chatGrey = Color("chatGrey")
}

struct ChatNav: View {
    @EnvironmentObject var fb: FirebaseSession
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    var body: some View {
    NavigationView{
        List(fb.Contacts, id: \.self) { user in
        NavigationLink(
        destination:ChatView(contactName:user)){
      Text(user)
        }
        .navigationBarTitle("Matches")
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
                            .padding(10)
                            .foregroundColor(Color.black)
                            .background(Color.chatGrey)
                            .clipShape(TextBubble(chat:false))
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
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .clipShape(TextBubble(chat:true))
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

struct TextBubble: Shape{
    var chat: Bool
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topRight, .topLeft, chat ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        return Path(path.cgPath)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(contactName:"Eric")
    }
}
