//
//  tabItems.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//
import SwiftUI

struct TabBarItem: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var image: String
    var imageSelect: String
}

let tabItems: [TabBarItem] = getTabItems()

func getTabItems() -> [TabBarItem] {
    //Image(systemName:
    var items = [TabBarItem]()
    let item0 = TabBarItem(id: 0, title: "Home", image:  "tab_home_normal", imageSelect:"tab_home_select")
    items.append(item0)
    let item1 = TabBarItem(id: 1, title: "Profile", image:  "tab_profile_normal", imageSelect: "tab_profile_select")
    items.append(item1)
    let item2 = TabBarItem(id: 2, title: "Chat", image:  "tab_chat_normal", imageSelect: "tab_chat_select")
    items.append(item2)
    let item3 = TabBarItem(id: 3, title: "Matches", image:  "tab_match_normal", imageSelect: "tab_match_select")
    items.append(item3)
    
    return items
}
