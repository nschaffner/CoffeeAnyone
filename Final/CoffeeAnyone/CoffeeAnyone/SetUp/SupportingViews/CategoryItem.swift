//
//  CategoryItem.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/27/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    @Environment(\.colorScheme) var colorScheme
    var image: String
    var text: String
    var body: some View {
        HStack{
            Image(image)
                .renderingMode(.original)
                .resizable()
                .frame(width:80, height:80, alignment: .leading)
                Text(text)
                    .fontWeight(.bold)
                    .foregroundColor(self.colorScheme == .dark ? Color.white : Color.black)
            }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(image: "coffeecupheart",text: "Click Here for Test")
    }
}
