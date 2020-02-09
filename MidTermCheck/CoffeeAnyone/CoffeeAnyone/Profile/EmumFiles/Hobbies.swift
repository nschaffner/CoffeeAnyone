//
//  Hobbies.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI


enum Hobbies: String, CaseIterable, Codable, Hashable {
        case climbing = "Climbing"
        case reading = "Reading"
        case maker = "Maker"
        case biking = "Biking"
        case sailing = "Sailing"
        case food = "Food Cooking/Eating"
        case soccer = "Soccer"
        case hiking = "Hiking"
        case birding = "Birding"
        case gardening = "Gardening"
        case art = "Art"
        case sports = "Sports"
        case exercise = "Exercise"
        case drinking = "Drinking"
        case socializing = "Social Events"
        case trivia = "Trivia"
        case running = "Running/Jogging"
        case music = "Music"
        case dancing = "Dancing"
        case undefined = "Other"
}
let allHobbies = Hobbies.allCases
