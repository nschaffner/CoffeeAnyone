//
//  ContentView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        var body: some View {
            
        TabView([Text("233")], titles: ["Home","Matches","Chat","Profile"],
            images: ["tab_home_normal","tab_match_normal","tab_chat_normal",
                                "tab_profile_normal"],
            imageSels: ["tab_home_select","tab_match_select","tab_chat_select",
                                  "tab_profile_select"])
            .edgesIgnoringSafeArea(.top)
        }
        func getIndex(item: TabBarItem) -> Int {
            return 0
        }
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
