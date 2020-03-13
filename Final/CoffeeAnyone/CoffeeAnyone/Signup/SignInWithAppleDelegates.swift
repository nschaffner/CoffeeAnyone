//
//  SignInWithAppleDelegates.swift
//  AppleIDTutorial
//
//  Created by Carrie Davis on 1/27/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import UIKit
import AuthenticationServices
import Combine
import SwiftUI

class SignInWithAppleDelegates: NSObject {
    private let signInSucceeded: (Result<[String], Error>) -> ()
    private weak var window: UIWindow!
    
    init(window: UIWindow?, onSignedIn: @escaping (Result<[String], Error>) -> ()) {
        self.window = window
        self.signInSucceeded = onSignedIn
    }
}

extension SignInWithAppleDelegates: ASAuthorizationControllerDelegate {
    private func registerNewAccount(credential: ASAuthorizationAppleIDCredential) {
        print("Registering new account with user: \(credential.user)")
        guard let appleIDToken = credential.identityToken else {
          print("Unable to fetch identity token")
          return
        }
        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
          print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
          return
        }
        guard let authcode = credential.authorizationCode else {
                 print("Unable to fetch auth code")
                 return
               }
        guard let authcodeString = String(data: authcode, encoding: .utf8) else {
                 print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                 return
               }
                //store this information locally
        UserDefaults.standard.set(credential.user, forKey: "userid")
        UserDefaults.standard.set(idTokenString, forKey: "id_token")
        UserDefaults.standard.set(authcodeString, forKey: "auth_code")
        print(UserDefaults.standard.string(forKey: "userid") ?? "NOtThere")
        UserDefaults.standard.set(credential.email, forKey: "email")
        UserDefaults.standard.set(credential.fullName?.givenName, forKey: "name")
        self.signInSucceeded(.success([credential.user, (credential.email ?? "Not available"), (credential.fullName?.givenName ?? "Not available"), (credential.fullName?.familyName ?? "Not available")]))
         print("ID TOKEN \(idTokenString)")
        print("authorization code \(authcodeString)")

    }
    
    private func signInWithExistingAccount(credential: ASAuthorizationAppleIDCredential) {
        print("Signing in with existing account with user: \(credential.user)")
        guard let appleIDToken = credential.identityToken else {
            print("Unable to fetch identity token")
            return
        }
        UserDefaults.standard.set(credential.user, forKey: "userid")
        print("UserID\(credential.user)")
        UserDefaults.standard.set(credential.fullName?.givenName, forKey: "name")
        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
            print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
            return
        }
        UserDefaults.standard.set(idTokenString, forKey: "id_token")
        self.signInSucceeded(.success([credential.user, (credential.email ?? "Not available"), (credential.email ?? "Not available")]))
        
       print("ID TOKEN \(idTokenString)")
        

    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {

        switch authorization.credential {
        case let appleIdCredential as ASAuthorizationAppleIDCredential:
            //if you receive the scope requested vars you know it's the first sign in
            if let _ = appleIdCredential.email, let _ = appleIdCredential.fullName {
                registerNewAccount(credential: appleIdCredential)
            } else {
                signInWithExistingAccount(credential: appleIdCredential)
            }
            break
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        //This is if the users authentication failed
        self.signInSucceeded(.failure(error))
        
    }
}

extension SignInWithAppleDelegates: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.window
    }
}

