//
//  Status.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

enum Status: String, CaseIterable, Codable, Hashable {
        case single = "Single"
        case divorced = "Divorced"
        case separated = "Separated"
        case widowed = "Widowed"
        case undefined = "Undefined"
}

let allStatus = Status.allCases
