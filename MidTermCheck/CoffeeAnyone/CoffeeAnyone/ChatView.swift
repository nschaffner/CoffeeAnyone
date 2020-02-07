//
//  ChatView.swift
//  chatView
//
//  Created by Eric Armstrong on 1/24/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//

import SwiftUI

struct ChatMessage : Hashable{
    var message: String
    var createdAt: String
    var isMe: Bool = false
    var timestamp: Int
    var senderId: String
}

struct ChatNav: View {
    @State var isActive = true
    let users = ["Fred"]
    var body: some View {
    NavigationView{
    List(users, id: \.self) { discipline in
        NavigationLink(
        destination:ChatView(isActive: self.$isActive)){
      Text(discipline)
        }
        .navigationBarTitle("Users")
//        ChatView()
    }
    
  }
}



struct ChatRow:View{
    var chatMessage: ChatMessage
    
    var body: some View{
        Group {
            if (chatMessage.senderId as String == "Eric") {
                
                HStack {
                    Group{
                        Text(chatMessage.senderId)
                        Text(chatMessage.message)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
            }
            else{
                HStack{
                    Group{
                        Spacer()
                        Text(chatMessage.message)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color.green)
                            .cornerRadius(10)
                        Text(chatMessage.senderId )
                    }
                }
            }
        }
    }
}

struct ChatView: View {
    @State var composedMessage: String = ""
    @ObservedObject var session = FirebaseSession()
    @Binding var isActive: Bool
    
    
    var body: some View {
        VStack {
            List {
                ForEach(session.messages, id:\.self){msg in
                    ChatRow(chatMessage: msg)
                }
                EmptyView()
            }.onAppear(perform: session.loadMsg)
            HStack{
                TextField("Message...", text: $composedMessage).frame(minHeight: CGFloat(30))
                Button(action:SendMessage){
                    Text("Send")
                }
            }.frame(minHeight: CGFloat(50)).padding()
        }
    }
    
    func SendMessage(){
        session.sendMessage(message:composedMessage)
        composedMessage = ""
    }
    
    func recieveMessage(){
        session.receiveMessage(user: "Fred")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
      ChatNav()
    }
}

}
