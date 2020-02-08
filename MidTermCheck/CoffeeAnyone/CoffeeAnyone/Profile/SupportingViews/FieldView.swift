//
//  FieldView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/8/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct FieldView: View {
    var fieldname:String
    var fieldvalue:String
    var body: some View {
         VStack {
            HStack{
                // ImageStore.shared.image(name: zoneImgName, size: 60)
                Text(fieldname).bold()
                 .cornerRadius(5)
                 .padding(.leading, 20)
                 .padding(.top, 10)
                 .padding(.bottom, 10)
                 Spacer()
                     Text(fieldvalue)
                         .font(Font.system(size: 16))
                        .padding(.horizontal, 20)
              
               
             }
            .background(Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0))
        }
    }
}

struct FieldView_Previews: PreviewProvider {
    static var previews: some View {
        FieldView(fieldname:"Age",fieldvalue: "24-30")
    }
}
