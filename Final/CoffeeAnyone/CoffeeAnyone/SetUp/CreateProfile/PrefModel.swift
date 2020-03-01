//
//  PrefModel.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/29/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI
import Combine

final class Preferences: ObservableObject {
   @Published var selectedType: BodyType = .undefined {
        didSet {
            let selected: String = String(selectedType.rawValue)
            print("Selected \(selected)")
            UserDefaults.standard.set(selected, forKey: "bodytypePref")
            print("HI \(String(describing: UserDefaults.standard.string(forKey: "bodytypePref")))")
        }
    }
    @Published var selectedAge: Age = .undefined {
         didSet {
             let selected: String = String(selectedAge.rawValue)
             print("Selected \(selected)")
             UserDefaults.standard.set(selected, forKey: "agePref")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "agePref")))")
         }
     }
    @Published var selectedEdu: Education = .undefined {
         didSet {
             let selected: String = String(selectedEdu.rawValue)
             print("Selected \(selected)")
             UserDefaults.standard.set(selected, forKey: "educationPref")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "educationPref")))")
         }
     }
    @Published var selectedGender: Gender = .undefined {
         didSet {
             let selected: String = String(selectedGender.rawValue)
             print("Selected \(selected)")
             UserDefaults.standard.set(selected, forKey: "genderPref")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "genderPref")))")
         }
     }
}
