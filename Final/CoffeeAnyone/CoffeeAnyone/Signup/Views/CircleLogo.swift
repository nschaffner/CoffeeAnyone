//
//  CircleLogo.swift
//  AppleIDTutorial
//
//  Created by Carrie Davis on 1/27/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//


import SwiftUI

struct CircleLogo: View {
    var body: some View {
        Image("coffeecupheart")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
    }
}

struct CircleLogo_Previews: PreviewProvider {
    static var previews: some View {
        CircleLogo()
    }
}

