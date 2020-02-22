//
//  MainView.swift
//  AppleIDTutorial
//
//  Created by Carrie Davis on 1/27/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI
import AuthenticationServices


struct MainView: View {
    
    @EnvironmentObject var signInWithAppleManager : SignInWithAppleManager
    
    
    var body: some View {
        VStack{
            Text("User Name : \(UserDefaults.standard.string(forKey: "username")!)")
            Text("User Email : \(UserDefaults.standard.string(forKey:"email")!)")
//            Text("\(signInWithAppleManager.isUserAuthenticated)")
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
