//
//  Http.swift
//  Profile
//
//  Created by Carrie Davis on 2/3/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//
import SwiftUI
import Combine
final class Http: ObservableObject {
    

    @Published var completed = false

    func postProfile() {
        
        
        //this is  a test url //httpbin.org/ that returns what is sent
        guard let url = URL(string: "http://httpbin.org/post") else { return }
        //this is where the User Defaults would be called to fill in the body
        let body: [String: Any] =
        [:]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        //set request headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
         guard let data = data else { return }
        
            let responseData = try! JSONDecoder().decode(Profile.self, from: data)
        print("Response Data: \(responseData)")
           // Need to figure out how to check for error this wasn't working bc didn't return expected status
           // if responseData.status == 200 {
            DispatchQueue.main.async {
            self.completed = true
         //       }
            }
        }
        task.resume()
    }
}
