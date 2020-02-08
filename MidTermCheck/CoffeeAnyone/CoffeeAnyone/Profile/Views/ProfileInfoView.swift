//
//  ProfileInfoView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/5/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct ProfileInfoView: View {
     @ObservedObject var profile = Profile()
    var body: some View {
<<<<<<< HEAD
        VStack(alignment: .leading) {
            ScrollView {
                Section(header: Text("Personal Statement").bold()) {
                    Spacer()
                    FieldView(fieldname:" ",fieldvalue: profile.statement)
                }
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
                Section(header: Text("Hobbies").bold()) {
                    HStack{
                        Text(profile.hobbies1.rawValue)
                        Text(profile.hobbies2.rawValue)
                        Text(profile.hobbies3.rawValue)
                    }
                }
            }
        }
=======
    Text("Im the basic profile view")
>>>>>>> e9f71064a8e8696b5edfee4b4784626393e14799
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
}
