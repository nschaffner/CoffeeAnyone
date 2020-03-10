//
//  InfoContainer.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 3/8/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct InfoContainer: View {
    var body: some View {
        VStack(alignment: .leading) {

            InfoView(title: "Create Profile", subTitle: "Share some information about yourself to find the best matches.", imageName: "checkmark.square")
            
            InfoView(title: "Learn More About Yourself", subTitle: "Our personality and relationship tests help you find better matches that fit your communication style.", imageName: "suit.heart")
            
            InfoView(title: "Get Matches", subTitle: "Matches are made based on you and your matches preferences.", imageName: "person.2.square.stack")

            InfoView(title: "Make Connections", subTitle: "Communcate with your matches with inapp chat.", imageName: "slider.horizontal.below.rectangle")
            }
            .padding(.horizontal)
        }
    }

struct InfoContainer_Previews: PreviewProvider {
    static var previews: some View {
        InfoContainer()
    }
}
