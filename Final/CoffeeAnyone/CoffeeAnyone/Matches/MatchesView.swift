//
//  MatchesView.swift
//  CoffeeAnyone
//
//  Created by Eric Armstrong on 2/14/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct MatchesNav: View {
    @EnvironmentObject var fb: FirebaseSession
    @State var results = [Results]()
    @State var url = ""
    @State var person:Users?
    @State var urls = [String:String]()
    
    var body: some View {
        NavigationView{
            List(results, id: \.name) { user in
                NavigationLink(destination:MatchesView(user:user, url:self.urls["\(user.photo_url)"] ?? "", photourl:"\(user.photo_url)", userid:"\(user.userid)")){
                    HStack{
                        if self.urls != [:]{
                            AnimatedImage(url: URL(string:self.urls["\(user.photo_url)"] ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                .shadow(radius: 1)
                                .padding( 10)
                                .frame(width: 60, height: 60)
                        }
                        else{
                            Downloader()
                        }
                    Text(user.name)
                    }.onAppear(perform:self.getImage)
                }
            }
            .navigationBarTitle("Matches")
        }.onAppear(perform:loadData)
    }

    func loadData(){
        let url = URL(string: "https://abetterdatingapp.appspot.com/matches/\(UserDefaults.standard.string(forKey: "userid") ?? "")")
        var request = URLRequest(url: url!)
        request.addValue("Bearer \(UserDefaults.standard.string(forKey: "id_token") ?? "")", forHTTPHeaderField: "Authorization")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        print(request)
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data!)
            print(response!)
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Results].self, from: data) {
                    DispatchQueue.main.async {
                        print(decodedResponse)
                        self.results = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    func getImage(){
        let storage = Storage.storage().reference()
        for photoResults in self.results{
            storage.child("profilePics/\(photoResults.photo_url).jpg").downloadURL { (url, err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                self.urls["\(photoResults.photo_url)"] = "\(url!)"
            }
        }
    }
}

struct MatchesView: View{
    @ObservedObject var profile = ProfileBody()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme
    @State var sayHello: Int? = nil
    

    var user:Results
    var url:String
    var photourl:String
    var userid:String
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                 .font(Font.title.weight(.semibold))
                Text("Back")
            }
        }
    }
    
    var body: some View{
        VStack(alignment: .leading) {
            VStack(alignment: .center){
                HStack(alignment: .top){
                    Spacer()
                     if url != ""{
                       AnimatedImage(url: URL(string: url)!)
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .clipShape(Circle())
                           .overlay(Circle().stroke(Color.white, lineWidth: 3))
                           .shadow(radius: 10)
                           .padding( 10)
                           .frame(width: 200, height: 200)
                       }
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

                NavigationLink(destination:ChatView(photourl:photourl, contactName: user.name, contactId:userid), tag:1, selection:$sayHello){
                    Spacer()
                    Button(action: {self.sayHello = 1}) {
                        HStack {
                            Image(systemName: "bubble.right.fill")
                            Text("Chat with \(user.name)")
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                    .cornerRadius(.infinity)
                    Spacer()
                }
                
                }
            
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
            }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
        }
    }

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesNav()
    }
}
