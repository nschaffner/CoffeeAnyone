//
//  ProfileHeaderView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct ProfileHeaderView: View {
   var name: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            VStack(alignment: .center){
                HStack(alignment: .center){
                    Spacer()
                    CircleImage(image:Image("youngelvis"))
                        .padding( 10)
                        .frame(height: 200)
                    Spacer()
                 }

                Text(name)
                .font(.body)
                .bold()
                        
                 .padding(.bottom,10)
                 
             }
            //.frame(height: 250)
             .background(Color.white
                 .cornerRadius(10, antialiased: true))
             .shadow(radius: 5)
             .padding(.horizontal, 10)
             .padding(.vertical, 10)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(name: "Ted BillyBob Thorton")
    }
}
