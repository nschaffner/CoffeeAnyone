//
//  HobbiesFormView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/29/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct HobbiesFormView: View {
      @ObservedObject var profile = Profile()
    var body: some View {
        VStack {
            Text("List Your Top 5 Hobbies").font(.title)
            Form {
                Picker(selection: $profile.selectedhobbies1, label: Text("1: Hobby")) {
                        ForEach(Hobbies.allCases, id: \.self) { hobby in
                            Text("\(hobby.rawValue)").tag(hobby)
                        }
                }
                Picker(selection: $profile.selectedhobbies2, label: Text("2: Hobby")) {
                        ForEach(Hobbies.allCases, id: \.self) { hobby in
                            Text("\(hobby.rawValue)").tag(hobby)
                        }
                }
                Picker(selection: $profile.selectedhobbies3, label: Text("3: Hobby")) {
                        ForEach(Hobbies.allCases, id: \.self) { hobby in
                            Text("\(hobby.rawValue)").tag(hobby)
                        }
                }
                Picker(selection: $profile.selectedhobbies4, label: Text("4: Hobby")) {
                        ForEach(Hobbies.allCases, id: \.self) { hobby in
                            Text("\(hobby.rawValue)").tag(hobby)
                        }
                }
                Picker(selection: $profile.selectedhobbies5, label: Text("5: Hobby")) {
                        ForEach(Hobbies.allCases, id: \.self) { hobby in
                            Text("\(hobby.rawValue)").tag(hobby)
                        }
                }
                Spacer()
            }
        }
    }
}

struct HobbiesFormView_Previews: PreviewProvider {
    static var previews: some View {
        HobbiesFormView()
    }
}
