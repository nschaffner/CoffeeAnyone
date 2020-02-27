//
//  TabView.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

struct TabView<Page: View>: View {
    var titles:[String]
    var imgs:[String]
    var imgSels:[String]
    var viewControllers: [UIHostingController<Page>]
    
    init(_ views: [Page], titles: [String], images:[String], imageSels:[String]) {
        
        let vc0 = UIHostingController(rootView: HomeView())
        let vc1 = UIHostingController(rootView: MatchesNav())
        let vc2 = UIHostingController(rootView: ChatNav())
        let vc3 = UIHostingController(rootView: ProfileView())
        self.viewControllers = [vc0,vc1,vc2,vc3] as! [UIHostingController<Page>]
        self.titles = titles
        self.imgs = images
        self.imgSels = imageSels
    }

    
    var body: some View {
        
        TabBarViewController(titles: titles, imgs: imgs, imgSels: imgSels, controllers: viewControllers)
    }
}

#if DEBUG
struct TabView_Previews : PreviewProvider {
    static var previews: some View {
        TabView([Text("haha"),Text("hah1"),Text("haa")],
                  titles: ["tab1","tab2","tab3"],
                  images: ["tab_home_normal","tab_chat_normal","tab_profile_normal"],
                  imageSels: ["tab_home_select","tab_chat_select","tab_profile_select"])
    }
}
#endif
