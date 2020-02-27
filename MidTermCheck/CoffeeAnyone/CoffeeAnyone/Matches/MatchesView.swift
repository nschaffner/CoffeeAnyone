//
//  MatchesView.swift
//  CoffeeAnyone
//
//  Created by Eric Armstrong on 2/14/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var id:Int
    var statement:String
    var name: String
    var age:String
    var occupation: String
    var personalitytype: String
    var education:String
    var haskids:String
    var gender:String
    var height:String
    var bodytype:String
    var city:String
    var hobbies1:String
    var hobbies2:String
    var hobbies3:String
    var hobbies4:String
    var hobbies5:String
}



struct MatchesNav: View {
    @EnvironmentObject var fb: FirebaseSession
    @State var results = [Result]()
        
    var body: some View {
    NavigationView{
        List(results, id: \.name) { user in
            NavigationLink(destination:MatchesView(user:user)){
                Text(user.name)
            }
        }
        .navigationBarTitle("Matches")
        }.onAppear(perform:loadData)
      }
    
    func loadData(){
        let token = "eyJraWQiOiI4NkQ4OEtmIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJodHRwczovL2FwcGxlaWQuYXBwbGUuY29tIiwiYXVkIjoiY29tLmFwcHNwb3QuYWJldHRlcmRhdGluZ2FwcC5zZXJ2ZXIiLCJleHAiOjE1ODIzMjY3NTYsImlhdCI6MTU4MjMyNjE1Niwic3ViIjoiMDAxNzY3LjcyMWIzNGFhMWNkNDRlYThiN2E1YTczNDdmNzNkYzc0LjIyNDYiLCJhdF9oYXNoIjoiaFU0RVUydDV2LTJqVkxxcnZOeGtmUSIsImVtYWlsIjoicXBodDV1ZWhja0Bwcml2YXRlcmVsYXkuYXBwbGVpZC5jb20iLCJlbWFpbF92ZXJpZmllZCI6InRydWUiLCJpc19wcml2YXRlX2VtYWlsIjoidHJ1ZSIsImF1dGhfdGltZSI6MTU4MjMyNjE1M30.NMfMkApwAUsllFcJqmTweH7j2wWSYVQtIC4gCFo-WhHH5NPAs0T__OVjmjynKKFZmVO0G2oUwKT5BX8eus1d2Zjpcccv0h_lTVoAbIKKEzMOiLjDfh1VV8sQkBULsBXdnB99BLl3VZHARPkym_7Y3W8D4QsmmpIxhoNPrHrbrkMM63P4IGU_bMqr10Xew3Ol3RUdeHOe5fALHNsop0zbDI8WOtMuDUNh3CiZoBK8BmGVa9_V8W3MoelhOOzFoP72qUjw77oy7k0rt_tfp54DVmSrk1snZdBaeRS-FTkdyY3tnf0POVQWv-CFQprKNvWDawPmGEB01t2_oE2c-Q3r0w"
        
        
        
        let url = URL(string: "https://abetterdatingapp.appspot.com/profiles")
        
        var request = URLRequest(url: url!)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        request.httpMethod = "GET"
        print(request)
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data!)
            print(response!)
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}


struct MatchesView: View{
    @ObservedObject var profile = Profile()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme
    @State var sayHello = false
    
    var user:Result
    
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
