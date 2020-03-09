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
    
    @ObservedObject var profile = ProfileBody()
    @Published var completed = false
    let token:String = UserDefaults.standard.string(forKey: "id_token") ?? ""

    func postProfile() {
        
        
        //this is  a test url //httpbin.org/ that returns what is sent
        guard let url = URL(string: "https://abetterdatingapp.appspot.com/profiles") else { return }
        
        //this is where the User Defaults would be called to fill in the body
        let body: [String: Any] =
        [
            "name":profile.name,
            "statement": profile.statement,
            "bodytype": profile.bodyType,
            "userid" : profile.user_id,
            "age": profile.age,
            "height": profile.height,
            "haskids": profile.hasKids,
            "gender": profile.gender,
            "status": profile.status,
            "occupation": profile.occupation,
            "education": profile.education,
            "city": profile.city,
            "state": profile.state,
            "hobbies1": profile.hobbies1,
            "hobbies2": profile.hobbies2,
            "hobbies3": profile.hobbies3,
            "hobbies4": profile.hobbies4,
            "hobbies5": profile.hobbies5,
            "bodytypePref": profile.bodyTypePref,
            "genderPref": profile.genderPref,
            "educationPref": profile.educationPref,
            "agePref": profile.agePref,
            "personalitytype": profile.personalitytype,
            "lovelang1": profile.lovelang1,
            "lovelang2": profile.lovelang2,
            "lovelang3": profile.lovelang3,
            "lovelang4": profile.lovelang4,
            "lovelang5": profile.lovelang5,
            "photo_url": profile.photo_url,
            "email": "none"
        ]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        print(finalBody)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        //set request headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        print(request)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(data!)
            print(response!)
             
       //  guard let data = data else { return }
        
        //    let responseData = try! JSONDecoder().decode(ProfileBody.self, from: data)
        //print("Response Data: \(responseData)")
   
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
