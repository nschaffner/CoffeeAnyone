//
//  PrefFormView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/29/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI
import Combine



struct PrefFormView: View {
    @ObservedObject var selected = Preferences()

    var body: some View {
      
       // NavigationView{
              VStack {
            Form {
                Picker(selection: $selected.selectedGender, label: Text("Gender")) {
                    ForEach(Gender.allCases, id: \.self) { gender in
                        Text("\(gender.rawValue)").tag(gender)
                    }
                }
                Picker(selection: $selected.selectedAge, label: Text("Age")) {
                    ForEach(Age.allCases, id: \.self) { age in
                        Text("\(age.rawValue)").tag(age)
                    }
                }
                Picker(selection: $selected.selectedEdu, label: Text("Education")) {
                    ForEach(Education.allCases, id: \.self) { edu in
                        Text("\(edu.rawValue)").tag(edu)
                    }
                }
                Picker(selection: $selected.selectedType, label: Text("Body Type")) {
                        ForEach(BodyType.allCases, id: \.self) { type in
                            Text("\(type.rawValue)").tag(type)
                        }
                    
                    }
               // .onReceive(selectedAge.rawValue){
              //      .standard.set(self.selectedAge.rawValue, forKey: "agePref")
             //   }
                           
              }
           // Text("Currently Selected: \(String(selectedAge.rawValue))")
          //       Text("Currently Selected: \(String(selectedGender.rawValue))")
        //Text("Hi \(Age.allAges[selectedAge].rawValue)")
            Spacer()
        }//.onDisappear{
            //set user defaults
          //  UserDefaults.standard.set(self.selectedAge.rawValue, forKey: "agePref")
         //   UserDefaults.standard.set(self.selectedGender.rawValue, forKey: "genderPref")
         //   UserDefaults.standard.set(self.selectedEdu.rawValue, forKey: "educationPref")
         //   UserDefaults.standard.set(self.selectedBodyType.rawValue, forKey: "bodytypePref")
        //    print("\(String(describing: UserDefaults.standard.string(forKey: "agePref")))")
        //      }
            //.navigationBarTitle("Specify Match Preferences",displayMode: .inline)
       // .navigationBarTitle("Specify Match Preferences",displayMode: .inline)
     //   .background(NavigationConfigurator { nc in
     //       nc.navigationBar.barTintColor = UIColor(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
    //        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
    //        })
    //    }.accentColor( .black)
    }
}

struct PrefFormView_Previews: PreviewProvider {
    static var previews: some View {
        PrefFormView()
    }
}
