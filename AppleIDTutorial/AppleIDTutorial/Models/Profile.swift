
//  UserProfile.swift
//  Profile
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//
import SwiftUI
import Combine

//class for Profile Data
final class Profile: ObservableObject, Codable {
    var name: String = UserDefaults.standard.string(forKey: "username") ?? "Elvis Presley"
    var user_id: String = UserDefaults.standard.string(forKey: "userid") ?? ""
    var statement: String = UserDefaults.standard.string(forKey: "statement") ?? "Hi I'm awesome because I'm Elvis and everyone wants a hunk a hunk a burning love."
    var bodyType: String = UserDefaults.standard.string(forKey: "bodytype") ?? "Curvy"
    var age: String = UserDefaults.standard.string(forKey: "age") ?? "66+"
    var height:String = UserDefaults.standard.string(forKey: "height") ?? "6'0"
    var hasKids: String = UserDefaults.standard.string(forKey: "haskids") ?? "Yes"
    var gender: String = UserDefaults.standard.string(forKey: "gender") ?? "Male"
    var status: String = UserDefaults.standard.string(forKey: "status") ?? "Separated"
    var occupation: String = UserDefaults.standard.string(forKey: "job") ?? "Entertainment"
    var education: String = UserDefaults.standard.string(forKey: "education") ?? "High School"
    var city: String = UserDefaults.standard.string(forKey: "city") ?? "Memphis"
    var state: String = UserDefaults.standard.string(forKey: "state") ?? "Tennesse"
    var hobbies1: String = UserDefaults.standard.string(forKey: "hobbie1") ?? "Food Cooking/Eating"
    var hobbies2: String = UserDefaults.standard.string(forKey: "hobbie2") ?? "Food Cooking/Eating"
    var hobbies3: String = UserDefaults.standard.string(forKey: "hobbie3") ?? "Food Cooking/Eating"
    var hobbies4: String = UserDefaults.standard.string(forKey: "hobbie4") ?? "Food Cooking/Eating"
    var hobbies5: String = UserDefaults.standard.string(forKey: "hobbie5") ?? "Food Cooking/Eating"
    var bodyTypePref: String = UserDefaults.standard.string(forKey: "bodytypePref") ?? "Slim"
    var genderPref: String = UserDefaults.standard.string(forKey: "genderPref") ?? "Female"
    var educationPref: String = UserDefaults.standard.string(forKey: "educationPref") ?? "Undefined"
    var agePref: String = UserDefaults.standard.string(forKey: "age") ?? "26-33"
    var personalitytype:String = UserDefaults.standard.string(forKey: "personalitytype") ?? "ENFP"
    var lovelang1:String = UserDefaults.standard.string(forKey: "lovelang1") ?? "0"
    var lovelang2:String = UserDefaults.standard.string(forKey: "lovelang2") ?? "0"
    var lovelang3:String = UserDefaults.standard.string(forKey: "lovelang3") ?? "0"
    var lovelang4:String = UserDefaults.standard.string(forKey: "lovelang4") ?? "0"
    var lovelang5:String = UserDefaults.standard.string(forKey: "lovelang5") ?? "0"
    var email:String = UserDefaults.standard.string(forKey: "email") ?? ""
}

    //doing this because I have different cites for different states,
    //but all need to go into city var not sure how to implement
    //stackoverflow.com/questions/45319562/swift-passing-different-enum-types-for-same-variable-to-a-class
    //protocol City {}

    enum GACities: String, CaseIterable, Codable, Hashable {
        case Atlanta = "Atlanta"
        case Savanna = "Savanna"
        case Marietta = "Marietta"
        case Decatur = "Decatur"
        case undefined = "Other"

}
      enum States: String, CaseIterable, Codable, Hashable {
        case Georgia = "Georgia"
        case undefined = "Other"
}
