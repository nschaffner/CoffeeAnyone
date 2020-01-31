//
//  ContentView.swift
//  CoffeAnyone
//
//  Created by Eric Armstrong on 1/31/20.
//  Copyright © 2020 Eric Armstrong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
   
    VStack {
        Text("Coffee Anyone Demo")
        Group {
            NavigationView {
                VStack {
                    NavigationLink(destination: SecondContentView()) {
                        Text("Chat Interface")
                            
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                    NavigationLink(destination: SecondContentView()) {
                        Text("Personality Quiz")
                    }.buttonStyle(PlainButtonStyle())
                                    Spacer()
                    NavigationLink(destination: SecondContentView()) {
                        Text("Login")
                    }.buttonStyle(PlainButtonStyle())
                                    Spacer()
                }
            }
        }
    }

   }
}
struct SecondContentView: View {
   var body: some View {
      Text("Hello, World!")
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
