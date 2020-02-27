//
//  CategoriesView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/27/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {
    //var step1complete:Bool = false
    //var step2complete:Bool = false
    //var step3complete:Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Text("Compete These 4 Steps To Find Out More About Yourself and Find Your Best Match")
                .font(.subheadline)
            .padding(.leading, 15)
            .padding(.top, 5)
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    CategoryItem(complete: false, stepname: "Step 1", image:"PersonalityQuiz")
                    CategoryItem(complete: false, stepname: "Step 2", image:"PersonalityQuiz")
                    CategoryItem(complete: false, stepname: "Step 3", image:"PersonalityQuiz")
                    CategoryItem(complete: false, stepname: "Step 4", image:"PersonalityQuiz")
                }
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
