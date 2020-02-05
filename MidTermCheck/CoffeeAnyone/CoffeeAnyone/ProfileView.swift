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
    @State private var changeView = "Basic"
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                ProfileHeaderView(name: "\(profile.name)" )
                HStack{
                    SegmentView(titles: ["  Your Profile  ","  Preferences  "," Quiz Results  "], currentPage: .constant(0))
                        .onTapGesture {
                            print("Tapped")
                    }
               
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
