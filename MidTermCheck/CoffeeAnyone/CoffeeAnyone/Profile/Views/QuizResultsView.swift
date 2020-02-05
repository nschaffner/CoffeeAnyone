//
//  QuizResults.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct QuizResultsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                SegmentView(titles: ["Your Profile","Your Preferences","Quiz Results"], currentPage: .constant(2))
                    .frame(width: 150, height: 450,alignment: .leading)
            Spacer()//keeps in the view
        }.padding(.leading, 10)
        Spacer()
        }
        //End of Segment Change View
    }
}

struct QuizResultsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultsView()
    }
}
