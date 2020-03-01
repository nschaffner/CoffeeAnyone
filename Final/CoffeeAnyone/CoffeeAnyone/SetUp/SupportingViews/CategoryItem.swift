//
//  CategoryItem.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/27/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    var image: String
    var text: String
    var body: some View {
        HStack{
            Image(image)
                .renderingMode(.original)
                .resizable()
                .frame(width:80, height:100, alignment: .leading)
                Text(text)
            }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(image: "coffeecupheart",text: "Click Here for Test")
    }
}
