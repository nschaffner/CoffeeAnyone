//
//  Gender.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

enum Gender: String, CaseIterable, Codable, Hashable {
        case female = "Female"
        case male = "Male"
        case nonbinary = "Non-Binary"
        case undefined = "Not Defined"

 static let allGenders = [female, male, nonbinary, undefined]
}
