//
//  ContentView.swift
//  AppleIDTutorial
//
//  Created by Carrie Davis on 1/27/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    
    
    @EnvironmentObject var signInWithAppleManager : SignInWithAppleManager
    
    var body: some View {
        ZStack{
            if signInWithAppleManager.isUserAuthenticated == .undefined {
                SignInView()
            }else if signInWithAppleManager.isUserAuthenticated == .signedIn{
                 MainView()
            }else if signInWithAppleManager.isUserAuthenticated == .signedOut{
                 SignInView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
