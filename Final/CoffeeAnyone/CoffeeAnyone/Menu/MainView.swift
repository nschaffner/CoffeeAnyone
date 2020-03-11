//
//  MainView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/26/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct MainView: View {

         var body: some View {
             
         TabView([Text("233")], titles: ["Matches","Chat","Profile","Personality"],
             images: ["tab_match_normal","tab_chat_normal",
                                 "tab_profile_normal", "tab_personality_normal"],
             imageSels: ["tab_match_select","tab_chat_select",
                                   "tab_profile_select", "tab_personality_select"])
             .edgesIgnoringSafeArea(.top)
         }
         func getIndex(item: TabBarItem) -> Int {
             return 0
         }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
