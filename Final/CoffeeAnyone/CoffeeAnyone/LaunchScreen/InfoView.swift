//
//  SwiftUIView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 3/8/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct InfoView: View {
      var title: String = "title"
        var subTitle: String = "subTitle"
        var imageName: String = "car"

        var body: some View {
            HStack(alignment: .center) {
                Image(systemName: imageName)
                    .font(.largeTitle)
                    .padding()
                    .accessibility(hidden: true)

                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .accessibility(addTraits: .isHeader)

                    Text(subTitle)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.top)
        }
    }
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
