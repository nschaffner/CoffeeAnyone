//
//  ProfileInfoView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/5/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI
import UIKit

struct ProfileInfoView: View {
     @ObservedObject var profile = Profile()
    //color does not change properly in dark mode still for Color sometimes
    //using colorScheme makes it changes
//stackoverflow.com/questions/59694589/change-background-color-when-dark-mode-turns-on-in-swiftui
     @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                Section(header: Text("Personal Statement").bold().background((colorScheme == .dark ? Color.black : Color.white))) {
                    Spacer()
                    Text(profile.statement)
                        .padding(20)
                    Spacer()
                }.background(colorScheme == .dark ? Color.black : Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0))
                Section(header: Text("Basics").bold()) {
                    FieldView(fieldname:"Status",fieldvalue: profile.status.rawValue)
                    FieldView(fieldname:"Gender",fieldvalue: profile.gender.rawValue)
                    FieldView(fieldname:"Occupation",fieldvalue: profile.occupation.rawValue)
                    FieldView(fieldname:"Education",fieldvalue: profile.education.rawValue)
                    FieldView(fieldname:"Has Kids",fieldvalue:profile.hasKids)
                }
                Section(header: Text("Stats").bold()) {
                    FieldView(fieldname:"Gender",fieldvalue:profile.gender.rawValue)
                    FieldView(fieldname:"Age",fieldvalue: profile.age.rawValue)
                FieldView(fieldname:"Height",fieldvalue: profile.height)
                    FieldView(fieldname:"Body Type",fieldvalue: profile.bodyType.rawValue)
                }
                Section(header: Text("Location").bold()) {
                    FieldView(fieldname:"Area",fieldvalue: profile.city.rawValue)
                    FieldView(fieldname:"State",fieldvalue: profile.state.rawValue)
                }
                Section(header: Text("Hobbies").bold().background((colorScheme == .dark ? Color.black : Color.white))) {
                    VStack{
                    HStack{
                        Text(profile.hobbies1.rawValue).padding(.leading,10)
                          Spacer()
                        Text(profile.hobbies2.rawValue)
                        Spacer()
                        Text(profile.hobbies3.rawValue).padding(.trailing,10)
                    }.padding(.bottom,10)
                    HStack{
                        Text(profile.hobbies4.rawValue).padding(.leading,10)
                        Spacer()
                        Text(profile.hobbies5.rawValue)
                        Spacer()
                        }
                    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                }.background(colorScheme == .dark ? Color.black : Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0))

            }
        }
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView().environment(\.colorScheme, .dark)
    }
}
