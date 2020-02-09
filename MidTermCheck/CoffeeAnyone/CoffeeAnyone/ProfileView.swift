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
    var body: some View {
        VStack(alignment: .leading) {
            ProfileHeaderView(name: "\(profile.name)" )
            HStack{
                Spacer()
                //future edit and camera use buttons
                Button(action: {
                    print("Edit button tapped!")
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
                Button(action: {
                    print("Camera button tapped!")
                }) {
                    Image(systemName: "camera.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                    Text("Edit Photo")
                        .font(.caption)
                }.padding(.horizontal,10)
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
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
