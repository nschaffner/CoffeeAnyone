//
//  Jobs.swift
//  UserProfile
//
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI

enum Jobs: String, CaseIterable, Codable, Hashable {
        case medical = "Medical"
        case armedforces = "Military"
        case tradeworker = "Craft and Related Profession"
        case clerical = "Clerical/Administrative"
        case technician = "Technical Profession"
        case law = "Lawyer or Related Law Profession"
        case safety = "Firefighter, Police or Related Profession"
        case sales = "Sales"
        case services = "Service Industry"
        case manager = "Management"
        case educator = "Education"
        case student = "Student"
        case other = "Other Profession"
        case undefined = "undefined"
}
let allJobs = Jobs.allCases
