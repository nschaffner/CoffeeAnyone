//
//  BodyType.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI
import Foundation

    enum BodyType: String, CaseIterable, Codable, Hashable {
        case curvy = "Curvy"
        case athletic = "Athletic"
        case slim = "Slim"
        case average = "Average"
        case undefined = "Other"
}

let allBodyTypes = BodyType.allCases
