//
//  CategoryItem.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/27/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI
//stackoverflow.com/questions/56938805/how-to-pass-one-swiftui-view-as-a-variable-to-another-view-struct
struct CategoryItem: View {
    //<Content: View>
    var complete: Bool
    var stepname: String
   // let viewBuilder: () -> Content
    var image: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(stepname)
                .foregroundColor(.primary)
                .font(.headline)
            Image(image)
            //viewBuilder()
                .renderingMode(.original)
                 .resizable()
                 .frame(width: 155, height: 260)
                 .cornerRadius(5)
        Spacer()
           
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
       // CategoryItem(complete: false, stepname: "Step 1", viewBuilder: {ProfileView()})
        CategoryItem(complete:false,stepname:"Step 2",image:"PersonalityQuiz")
    }
}
