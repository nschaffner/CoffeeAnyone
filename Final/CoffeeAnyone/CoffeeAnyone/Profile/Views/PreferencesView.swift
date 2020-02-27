//
//  PreferencesView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {
    @ObservedObject var profile = Profile()
     @Environment(\.colorScheme) var colorScheme
       var body: some View {
           VStack(alignment: .leading) {
               ScrollView {
                //really need to sort out how I will handle arrays mostly I will use enums for question and then I think I'll
                //fill with string from the enum into an array so easier to list. However I will need to assign id.
                FieldView(fieldname:"Age",fieldvalue: profile.agePref)
                FieldView(fieldname:"Gender",fieldvalue: profile.genderPref)
                FieldView(fieldname:"Education",fieldvalue: profile.educationPref)
                FieldView(fieldname:"Body Type",fieldvalue:profile.bodyTypePref)
                    FieldView(fieldname:"Kids",fieldvalue:profile.hasKids)
                       }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                   }.background(colorScheme == .dark ? Color.black : Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0))
       }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
