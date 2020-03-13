//
//  HomeView.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Personality Quiz").fontWeight(.bold)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("The Myers-Briggs Personality Type Indicator was designed to help individuals manage issues of personal change and growth. Please tap on the following link to learn more about this quiz:")
                .fixedSize(horizontal: false, vertical: true)
                .padding(10)
                .multilineTextAlignment(.center)
                NavigationLink(destination: PersonalityDescView()) {
                    Text("More Info").fontWeight(.bold)
                    .padding(10)
                }
                Text("")
                Text("")
                Text("Love Languages Quiz").fontWeight(.bold)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Everyone gives and receives love differently. The Five Love Languages Quiz was designed to help individuals learn how they give and receive love so that they might be better equipped to communicate love well. Please tap on the following link to learn more about this quiz:")
                .fixedSize(horizontal: false, vertical: true)
                .padding(10)
                .multilineTextAlignment(.center)
                NavigationLink(destination: LoveLangDescView()) {
                    Text("More Info").fontWeight(.bold)
                    .padding(10)
                }
            }
        }
    }
}

struct PersonalityDescView: View {
    
    @State private var showPersonalitySheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                VStack {
                    Text("Personality Quiz Description").fontWeight(.bold)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    Text("")
                    Text("The Myers-Briggs Personality Type Indicator is broken up into four areas:")
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(10)
                        .multilineTextAlignment(.center)
                    Text("Favorite World").fontWeight(.bold)
                        .foregroundColor(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                        .padding(.top, 10)
                    Text("Do you prefer to focus on the outer world or on your own inner world? This is called Extroversion (E) or Introversion (I).")
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(10)
                        //.multilineTextAlignment(.center)
                    Text("Information").fontWeight(.bold)
                        .foregroundColor(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                        .padding(.top, 10)
                    Text("Do you prefer to focus on the basic information you take in or do you prefer to interpret and add meaning? This is called Sensing (S) or Intuition (N).")
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(10)
                        //.multilineTextAlignment(.center)
                }
                VStack {
                    Text("Descriptions").fontWeight(.bold)
                        .foregroundColor(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                        .padding(.top, 10)
                    Text("When making decisions, do you prefer to first look at logic and consistency or first look at the people and special circumstances? This is called Thinking (T) or Feeling (F).")
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(10)
                        //.multilineTextAlignment(.center)
                    Text("Structure").fontWeight(.bold)
                        .foregroundColor(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                        .padding(.top, 10)
                    Text("In dealing with the outside world, do you prefer to get things decided or do you prefer to stay open to new information and options? This is called Judging (J) or Perceiving (P).")
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(10)
                        //.multilineTextAlignment(.center)
                    Text("")
                    Text("Your personality type can be expressed as a code of four letters that is found listed on your profile page. Tap on the following link to learn more about this code:")
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(10)
                        .multilineTextAlignment(.center)
                     Button(action: {self.showPersonalitySheet = true}) {
                                   HStack {
                                       Image("tab_personality_normal")
                                       Text("Read Personality Quiz Descriptions")
                                   }
                               }
                               .padding()
                               .foregroundColor(.white)
                               .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                               .cornerRadius(.infinity)
                                
                }.sheet(isPresented: self.$showPersonalitySheet) {
                        PersonalityDescription()
                    }
            }
        }
    }
}

struct LoveLangDescView: View {
    
    @State private var showLoveSheet: Bool = false
    
    var body: some View {
        VStack {
            Text("Love Languages Quiz Description").fontWeight(.bold)
                .fixedSize(horizontal: false, vertical: true)
                .padding(10)
                .font(.title)
                .multilineTextAlignment(.center)
            Text("")
            Text("The highest score indicates your primary love language. The lower scores indicate those languages you seldom use to communicate love and which probably don’t affect you very much on an emotional level. Tap on the following link to learn more about your love languages:")
                .fixedSize(horizontal: false, vertical: true)
                .padding(10)
                .multilineTextAlignment(.center)
            Button(action: {self.showLoveSheet = true}) {
                HStack {
                    Image("hearticon")
                    Text("Read Love Languages Quiz Descriptions")
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
            .cornerRadius(.infinity)
        }.sheet(isPresented: self.$showLoveSheet) {
                LoveLangDescription()
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
