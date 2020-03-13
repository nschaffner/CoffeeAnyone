//
//  SignInWithAppleManager.swift
//  AppleIDTutorial
//
//  Created by Carrie Davis on 1/27/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//
import SwiftUI
import AuthenticationServices

class SignInWithAppleManager: ObservableObject {
    @ObservedObject var http = Http()
    @Published var isUserAuthenticated: AuthState = .undefined
    let userIdentifierKey = ""
  
    func checkUserAuth(completion: @escaping (AuthState) -> ()) {
         //completion handler defines authstate
        guard let userIdentifier = UserDefaults.standard.string(forKey: "userid") else {
            print("User identifier does not exist")
            self.isUserAuthenticated = .undefined
             //userid is not defined in User defaults bc error returned
            completion(.undefined)
            return
        }
        if userIdentifier == "" {
            print("User identifier is empty string")
            self.isUserAuthenticated = .undefined
            //userid is not defined in User defaults bc empty, something went wrong
            completion(.undefined)
            return
        }
        //now check user using apple checks
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: userIdentifier) { (credentialState, error) in
            DispatchQueue.main.async {
                switch credentialState {
                case .authorized:
                    // The Apple ID credential is valid. Show Home UI Here
                    print("Credential state: .authorized")
                    self.isUserAuthenticated = .signedIn
                    completion(.signedIn)
                    //Trying to post profile after user is signed in
                    self.http.postProfile()
                    break
                case .revoked:
                    // The Apple ID credential is revoked. Show SignIn UI Here.
                    print("Credential state: .revoked")
                    self.isUserAuthenticated = .undefined
                    completion(.undefined)
                    break
                case .notFound:
                    // No credential was found. Show SignIn UI Here.
                    print("Credential state: .notFound")
                    self.isUserAuthenticated = .signedOut
                    completion(.signedOut)
                    break
                default:
                    break
                }
            }
        }
    }
    
}
