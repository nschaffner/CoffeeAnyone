//
//  Profile.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

//
//  UserProfile.swift
//  Profile
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//
import SwiftUI
import Combine

//class for Profile Data
final class Profile: ObservableObject, Codable {
    var name: String = "Elvis"
    var user_id: Int = 999999
    var statement: String = "Hi I'm awesome because I'm Elvis and everyone wants a hunk a hunk of burning love."
    var bodyType: BodyType = .curvy
    var age: Age = .seventies
    var hasKids: Bool = true
    var gender: Gender = .male
    var status: Status = .separated
    var occupation: Jobs = .other
    var education: Education = .highschool
    var city: GACities = .Savanna
    var state: States = .Georgia
    var hobbies1: Hobbies = .food
    var hobbies2: Hobbies = .music
    var hobbies3: Hobbies = .socializing
    var hobbies4: Hobbies = .undefined
    var hobbies5: Hobbies = .undefined
    var bodyTypePref: BodyType = .average
    var genderPref: Gender = .female
    var educationPref: Education = .undefined
    var agePref: Age = Age.twenty
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
