//
//  IntroductionView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 3/8/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct IntroductionView: View {
    @State private var continuing = false
    var body: some View {
        NavigationView {
        ScrollView {
            VStack(alignment: .center) {
                CircleLogo().edgesIgnoringSafeArea(.top)
                .frame(width: 100, height: 100)
                 Text("Coffee Anyone?")
                     .font(.largeTitle)
                     .padding()
                Text("Find the person you are really looking for.")
                InfoContainer()
                Spacer(minLength: 30)
                Button(action: {
                     self.continuing.toggle()
                    }) {
                        Text("Continue")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(width: 350, height: 60, alignment: .center)
                        .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                        .cornerRadius(10)
                    }
                      .padding(.horizontal)
                NavigationLink(destination: CategoriesView(), isActive: $continuing) {
                               EmptyView()
                           }
            }
            
        }
        }.accentColor( .black)
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
