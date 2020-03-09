//
//  ProfileModel.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/29/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI
import Combine

final class Profile: ObservableObject {
   var selected: String = "No"
   @Published var statement: String = "" {
        didSet {
            //let selected: String = String(selectedType.rawValue)
           // print("Selected \(selected)")
            UserDefaults.standard.set(statement, forKey: "statement")
            print("HI \(String(describing: UserDefaults.standard.string(forKey: "statement")))")
        }
    }
    @Published var selectedStatus: Status = .undefined {
         didSet {
             let selected: String = String(selectedStatus.rawValue)
             print("Selected \(selected)")
             UserDefaults.standard.set(selected, forKey: "status")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "status")))")
         }
     }
    @Published var city: String = "" {
         didSet {
             //let selected: String = String(selectedType.rawValue)
            // print("Selected \(selected)")
             UserDefaults.standard.set(city, forKey: "city")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "city")))")
         }
     }
    @Published var state: String = "" {
         didSet {
             //let selected: String = String(selectedType.rawValue)
            // print("Selected \(selected)")
             UserDefaults.standard.set(state, forKey: "state")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "state")))")
         }
     }
    @Published var height: String = "" {
         didSet {
             //let selected: String = String(selectedType.rawValue)
            // print("Selected \(selected)")
             UserDefaults.standard.set(height, forKey: "height")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "height")))")
         }
     }
    @Published var haskids: Bool = false {
         didSet {
            if haskids == true {
                self.selected = "Yes"
            }
            else {
                self.selected = "No"
            }
            // print("Selected \(selected)")
            UserDefaults.standard.set(self.selected, forKey: "haskids")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "haskids")))")
         }
     }
    @Published var selectedType: BodyType = .undefined {
        didSet {
            let selected: String = String(selectedType.rawValue)
            print("Selected \(selected)")
            UserDefaults.standard.set(selected, forKey: "bodytype")
            print("HI \(String(describing: UserDefaults.standard.string(forKey: "bodytype")))")
        }
    }
    @Published var selectedAge: Age = .undefined {
         didSet {
             let selected: String = String(selectedAge.rawValue)
             print("Selected \(selected)")
             UserDefaults.standard.set(selected, forKey: "age")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "age")))")
         }
     }
    @Published var selectedEdu: Education = .undefined {
         didSet {
             let selected: String = String(selectedEdu.rawValue)
             print("Selected \(selected)")
             UserDefaults.standard.set(selected, forKey: "education")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "education")))")
         }
     }
    @Published var selectedGender: Gender = .undefined {
         didSet {
             let selected: String = String(selectedGender.rawValue)
             print("Selected \(selected)")
             UserDefaults.standard.set(selected, forKey: "gender")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "gender")))")
         }
     }
    @Published var selectedJobs: Jobs = .undefined {
         didSet {
             let selected: String = String(selectedJobs.rawValue)
             print("Selected \(selected)")
             UserDefaults.standard.set(selected, forKey: "occupation")
             print("HI \(String(describing: UserDefaults.standard.string(forKey: "occupation")))")
         }
     }
    @Published var selectedhobbies1: Hobbies = .undefined {
        didSet {
            let selected: String = String(selectedhobbies1.rawValue)
            print("Selected \(selected)")
            UserDefaults.standard.set(selected, forKey: "hobbies1")
            print("HI \(String(describing: UserDefaults.standard.string(forKey: "hobbies1")))")
        }
    }
    @Published var selectedhobbies2: Hobbies = .undefined {
        didSet {
            let selected: String = String(selectedhobbies2.rawValue)
            print("Selected \(selected)")
            UserDefaults.standard.set(selected, forKey: "hobbies2")
            print("HI \(String(describing: UserDefaults.standard.string(forKey: "hobbies2")))")
        }
    }
    @Published var selectedhobbies3: Hobbies = .undefined {
        didSet {
            let selected: String = String(selectedhobbies3.rawValue)
            print("Selected \(selected)")
            UserDefaults.standard.set(selected, forKey: "hobbies3")
            print("HI \(String(describing: UserDefaults.standard.string(forKey: "hobbies3")))")
        }
    }
    @Published var selectedhobbies4: Hobbies = .undefined {
        didSet {
            let selected: String = String(selectedhobbies4.rawValue)
            print("Selected \(selected)")
            UserDefaults.standard.set(selected, forKey: "hobbies4")
            print("HI \(String(describing: UserDefaults.standard.string(forKey: "hobbies4")))")
        }
    }
    @Published var selectedhobbies5: Hobbies = .undefined {
        didSet {
            let selected: String = String(selectedhobbies5.rawValue)
            print("Selected \(selected)")
            UserDefaults.standard.set(selected, forKey: "hobbies5")
            print("HI \(String(describing: UserDefaults.standard.string(forKey: "hobbies5")))")
        }
    }
}
