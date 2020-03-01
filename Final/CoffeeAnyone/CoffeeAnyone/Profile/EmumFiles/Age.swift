//
//  Age.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

enum Age: String, CaseIterable, Codable, Hashable {
        case teens = "18-25"
        case twenty = "26-33"
        case thirty = "34-41"
        case forty = "42-49"
        case fifty = "50-57"
        case sixty = "58-65"
        case seventies = "66+"
        case undefined = "Not Defined"
    
    static let allAges = [teens, twenty, thirty, forty, fifty, sixty, seventies, undefined]
}


