//
//  QuizResults.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct QuizResultsView: View {
        let extravert = "Extraverted"
         let introvert = "Introverted"
         let thinking = "Thinking"
         let feeling = "Feeling"
         let sensing = "Sensing"
         let intuiting = "Intuitive"
         let introvertdesc = "You prefer quiet contemplation and reflection."
         let extraverteddesc = "You prefer spending your time interacting with the outside world."
         let perceiving = "Perceiving"
         let judging = "Judging"
         let judgedesc = "You have a mental process for receiving information and like to plan and organise"
         let perceivedesc = "You prefer to take information without evaluation and act in a flexable manner"
         let thinkingdesc = "You approach life in a rational, analytical way."
         let feelingdesc = "You identify the emotional value in events and objects."
         let sensingdesc = "You focus on the facts and hard data."
         let intuitdesc = "You can see possibilities that are not immediately obvious."
         let ISTJ = "Introverted Sensing with Extraverted Thinking"
         let ISTP = "Introverted Thinking with Extraverted Sensing"
         let ISFJ = "Introverted Sensing with Extraverted Feeling"
         let ESTJ = "Extraverted Thinking with Introverted Sensing"
         let ESFJ = "Extraverted Feeling with Introverted Sensing"
         let ISFP = "Introverted Feeling with Extraverted Sensing"
         let ESTP = "Extraverted Sensing with Introverted Thinking"
         let ESFP = "Extraverted Sensing with Introverted Feeling"
         let INFP = "Introverted Feeling with Extraverted Intuiting"
         let ENTP = "Extraverted Intuiting with Introverted Thinking"
         let ENFP = "Extraverted Intuiting with Introverted Feeling"
         let INTJ = "Introverted Intuiting with Extraverted Thinking"
         let INFJ = "Introverted Intuiting with Extraverted Feeling"
         let ENTJ = "Extraverted Thinking with Introverted Intuiting"
         let ENFJ = "Extraverted Feeling with Introverted Thinking"

         var body: some View {
            ScrollView{
             VStack {
                Text("Your Type: \(UserDefaults.standard.string(forKey: "personalitytype") ?? " ")").fontWeight(.bold)
                 //Filler code for now
                Text(ENFP).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Divider()
         //This is details. Maybe this could be done with navigation to get description details?
                Group{
                    Text("\(extravert)")
                        .fontWeight(.bold)
                    Text(extraverteddesc)
                        .font(Font.system(size: 16))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .frame(height: 50)
                }
                Divider()
                Group{
                    Text(intuiting)
                        .fontWeight(.bold)
                    Text(intuitdesc)
                    .font(Font.system(size: 16))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .frame(height: 50)
                     }
                Divider()
                Group{
                    Text(feeling).fontWeight(.bold)
                        .fontWeight(.bold)
                    Text(feelingdesc)
                        .font(Font.system(size: 16))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .frame(height: 50)
                       
                }
                Divider()
                Group{
                    Text(perceiving).fontWeight(.bold)
                        .fontWeight(.bold)
                    Text(perceivedesc)
                        .font(Font.system(size: 16))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .frame(height: 50)
                        
                }
            }
            }
    }
}

struct QuizResultsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultsView()
    }
}
