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
    //color does not change properly in dark mode still for Color sometimes
    //using colorScheme makes it changes
//stackoverflow.com/questions/59694589/change-background-color-when-dark-mode-turns-on-in-swiftui
     @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                Section(header: Text("Personal Statement").bold().background((colorScheme == .dark ? Color.black : Color.white))) {
                    Spacer()
                    Text(UserDefaults.standard.string(forKey: "statement") ?? " ")
                        .padding(20)
                    Spacer()
                }.background(colorScheme == .dark ? Color.black : Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0))
                Section(header: Text("Basics").bold()) {
                    FieldView(fieldname:"Status",fieldvalue: UserDefaults.standard.string(forKey: "status") ?? " ")
                    FieldView(fieldname:"Gender",fieldvalue: UserDefaults.standard.string(forKey: "gender") ?? " ")
                    FieldView(fieldname:"Occupation",fieldvalue: UserDefaults.standard.string(forKey: "occupation") ?? " ")
                    FieldView(fieldname:"Education",fieldvalue: UserDefaults.standard.string(forKey: "education") ?? " ")
                    FieldView(fieldname:"Has Kids",fieldvalue: UserDefaults.standard.string(forKey: "haskids") ?? " ")
                }
                Section(header: Text("Stats").bold()) {
                    FieldView(fieldname:"Age",fieldvalue: UserDefaults.standard.string(forKey: "age") ?? " ")
                FieldView(fieldname:"Height",fieldvalue: UserDefaults.standard.string(forKey: "height") ?? " ")
                    FieldView(fieldname:"Body Type",fieldvalue: UserDefaults.standard.string(forKey: "bodytype") ?? " ")
                }
                Section(header: Text("Location").bold()) {
                    FieldView(fieldname:"Area",fieldvalue: UserDefaults.standard.string(forKey: "city") ?? " ")
                    FieldView(fieldname:"State",fieldvalue: UserDefaults.standard.string(forKey: "state") ?? " ")
                }
                Section(header: Text("Hobbies").bold().background((colorScheme == .dark ? Color.black : Color.white))) {
                    VStack{
                    HStack{
                        Text(UserDefaults.standard.string(forKey: "hobbies1") ?? " ").padding(.leading,10)
                          Spacer()
                        Text(UserDefaults.standard.string(forKey: "hobbies2") ?? " ")
                        Spacer()
                        Text(UserDefaults.standard.string(forKey: "hobbies3") ?? " ").padding(.trailing,10)
                    }.padding(.bottom,10)
                    HStack{
                        Text(UserDefaults.standard.string(forKey: "hobbies4") ?? " ").padding(.leading,10)
                        Spacer()
                        Text(UserDefaults.standard.string(forKey: "hobbies5") ?? " ")
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
