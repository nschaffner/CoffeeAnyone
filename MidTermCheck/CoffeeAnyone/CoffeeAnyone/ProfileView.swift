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
    //@ObservedObject var index: Index
    @State private var changeView = 0
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                ProfileHeaderView(name: "\(profile.name)" )
                HStack{
                    SegmentView(titles: ["  Your Profile  ","  Preferences  "," Quiz Results  "], currentPage: self.$changeView)
                }
                
                Text("\(changeView)").padding()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
