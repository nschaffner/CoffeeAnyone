//
//  Education.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

enum Education: String, CaseIterable, Codable, Hashable {
        case highschool = "High School"
        case tech = "Technical"
        case college = "Some College"
        case undergraduate = "Undergraduate"
        case associate = "Associate"
        case graduate = "Graduate"
        case vocational = "Vocational"
        case master = "Master"
        case phd = "Doctorate"
        case undefined = "Other"
}

let allEducation = Education.allCases
