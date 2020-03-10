//
//  ContentView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var signInWithAppleManager : SignInWithAppleManager
        var body: some View {
            ZStack{
               // if UserDefaults.standard.string(forKey:"userid") != nil {
               //     MainView()
               // }
               
            if signInWithAppleManager.isUserAuthenticated == .undefined {
                    //SignInView()
                IntroductionView()
            }
            else if signInWithAppleManager.isUserAuthenticated == .signedIn {
                     MainView()
            }
            else if signInWithAppleManager.isUserAuthenticated == .signedOut{
                     //SignInView()
                MainView()
            }
          
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
