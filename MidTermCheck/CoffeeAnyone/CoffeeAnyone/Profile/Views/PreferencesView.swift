//
//  PreferencesView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
       VStack(alignment: .leading, spacing: 10){
            HStack{
               SegmentView(titles: ["Your Profile","Your Preferences","Quiz Results"], currentPage: .constant(1))
                   .frame(width: 200, alignment: .leading)
                   Spacer()
            }.padding(.leading, 10)
            Spacer()
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
