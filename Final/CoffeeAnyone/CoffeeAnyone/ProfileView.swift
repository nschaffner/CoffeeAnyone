//
//  ProfileView.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profile = Profile()
    @State private var changeView = 0
    @State var isNavigationBarHidden: Bool = true
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ProfileHeaderView(name: "\(profile.name)" )
                HStack{
                    //future edit and camera use buttons
                    Spacer()
                    Button(action: {
                        print("Edit button tapped!")
                        print("user id: \(self.profile.user_id)")
                    }) {
                        Image(systemName: "pencil.circle")
                            .font(.title)
                            .foregroundColor(.gray)
                        Text("Edit Profile")
                            .font(.caption)
                    }
                    Spacer()
                    Button(action: {
                        print("Pref Edit button tapped!")
                    }) {
                        Image(systemName: "pencil.circle")
                            .font(.title)
                            .foregroundColor(.gray)
                        Text("Edit Preferences")
                            .font(.caption)
                    }
                    NavigationLink(destination: UpdateMediaView()) {
                        EditButton(image:"camera.circle",text:"Edit Photo")
                    }
                    Spacer()
                }
                    HStack{
                        SegmentView(titles: ["  Your Profile  ","  Preferences  "," Quiz Results  "], currentPage: self.$changeView)

                    }
                //changes the bottom view based on which button is selected
                if self.changeView == 0{
                    ProfileInfoView()
                }
                if self.changeView == 1 {
                    PreferencesView()
                }
                if self.changeView == 2 {
                    QuizResultsView()
                }
                Spacer()
            }
            //.navigationBarHidden(true)
            .navigationBarTitle("Back")
            .navigationBarHidden(isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
            .onDisappear {
                self.isNavigationBarHidden = false
            }
        }
    }
}

struct EditButton: View {
    var image: String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.title)
                .foregroundColor(.gray)
             Text(text)
                .font(.caption)
        }
        .padding(.horizontal,10)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
