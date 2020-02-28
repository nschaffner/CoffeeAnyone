//
//  MatchesView.swift
//  CoffeeAnyone
//
//  Created by Eric Armstrong on 2/14/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct MatchesNav: View {
    @EnvironmentObject var fb: FirebaseSession
    @EnvironmentObject var ma: MatchesAPI
    @State var results = [Results]()
    let matchApi = MatchesAPI()
    var body: some View {
    NavigationView{
        List(results, id: \.name) { user in
            NavigationLink(destination:MatchesView(user:user)){
                Text(user.name)
            }
        }
        .navigationBarTitle("Matches")
    }.onAppear(perform:matchApi.loadData)
      }
}

struct MatchesView: View{
    @ObservedObject var profile = Profile()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme
    @State var sayHello = false
    
    var user:Results
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Text("Go back")
            }
        }
    }
    
    var body: some View{
        VStack(alignment: .leading) {
            VStack(alignment: .center){
                HStack(alignment: .top){
                    Spacer()
                    CircleImage(image:Image("youngelvis"))
                        .padding( 10)
                        .frame(height: 200)
                    Spacer()
                 }
                Text(user.name)
                .font(.body)
                .bold()
                .padding(.bottom,10)
             }
             .background(Color.white
                 .cornerRadius(10, antialiased: true)
            )
            
            HStack{
                Spacer()
                NavigationLink(destination:ChatView(contactName: user.name)){
                    Text("Chat with Me!")
                }
                Spacer()
            }
            .onAppear(perform:{
                    self.sayHello = false
                })
                .sheet(isPresented:$sayHello){
                    ChatView(contactName: self.user.name)
            }

//                 .shadow(radius: 5)
//                 .padding(.horizontal, 10)
//                 .padding(.vertical, 10)
                    ScrollView {
                        Section(header: Text("Personal Statement").bold().background((colorScheme == .dark ? Color.black : Color.white))) {
                            HStack{
                            Spacer()
                            Text(user.statement)
                                .padding(20)
                                Spacer()
                                
                            }
                        }.background(colorScheme == .dark ? Color.black : Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0))
                            
                        Section(header: Text("\(user.name)'s Info").bold()) {
                            FieldView(fieldname:"Status",fieldvalue: user.name)
                            FieldView(fieldname:"Location",fieldvalue: user.city)
                            FieldView(fieldname:"Gender",fieldvalue: user.gender)
                            FieldView(fieldname:"Occupation",fieldvalue: user.occupation)
                            FieldView(fieldname:"Education",fieldvalue: user.education)
                            FieldView(fieldname:"Has Kids",fieldvalue:user.haskids)
                            FieldView(fieldname:"Gender",fieldvalue:user.hobbies1)
                            FieldView(fieldname:"Age",fieldvalue: user.age)
                            FieldView(fieldname:"Height",fieldvalue: user.height)
                            FieldView(fieldname:"Body Type",fieldvalue: user.bodytype)
                        }
                        Section(header: Text("Hobbies").bold()) {
                            VStack{
                            HStack{
                                Text(user.hobbies1).padding(.leading,10)
                                  Spacer()
                                Text(user.hobbies2)
                                Spacer()
                                Text(user.hobbies3).padding(.trailing,10)
                            }.padding(.bottom,10)
                            HStack{
                                Text(user.hobbies4).padding(.leading,10)
                                Spacer()
                                Text(user.hobbies5)
                                Spacer()
                                }
                            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        }.background(colorScheme == .dark ? Color.black : Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0))

                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: btnBack)
            }
    }

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesNav()
    }
}
