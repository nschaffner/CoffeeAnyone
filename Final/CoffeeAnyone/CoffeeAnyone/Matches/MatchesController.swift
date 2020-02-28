//
//  MatchesController.swift
//  CoffeeAnyone
//
//  Created by Eric Armstrong on 2/28/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import Foundation
import SwiftUI

class MatchesAPI: ObservableObject{
    @State var results = [Results]()
    init(){
    }

    func loadData(){
           let url = URL(string: "https://abetterdatingapp.appspot.com/profiles")
           var request = URLRequest(url: url!)
        request.addValue("Bearer \(UserDefaults.standard.string(forKey: "id_token") ?? "")", forHTTPHeaderField: "Authorization")
           request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
           request.httpMethod = "GET"
           
           print(request)
           URLSession.shared.dataTask(with: request) { data, response, error in
               print(data!)
               print(response!)
               if let data = data {
                   if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                       DispatchQueue.main.async {
                           self.results = decodedResponse.results
                       }
                       return
                   }
               }
               print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
           }.resume()
       }
}

