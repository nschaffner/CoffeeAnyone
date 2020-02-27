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
    
    @Published var isUserAuthenticated: AuthState = .undefined
    let userIdentifierKey = ""
    
    init() {
            checkUserAuth { (authState) in
                switch authState {
                case .undefined:
                    self.isUserAuthenticated = .undefined
                    print("Auth State = .undefined")
                case .signedOut:
                    self.isUserAuthenticated = .signedOut
                    print("Auth State = .signedOut")
                case .signedIn:
                    self.isUserAuthenticated = .signedIn
                    print("Auth State = .signedIn")
                }
        }
    }

    func checkUserAuth(completion: @escaping (AuthState) -> ()) {
         //completion handler defines authstate
        guard let userIdentifier = UserDefaults.standard.string(forKey:"userid") else {
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
