//
//  QuizResults.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct QuizResultsView: View {

    let ISTJ = "Introverted Sensing with Extraverted Thinking"
    let ISTP = "Introverted Thinking with Extraverted Sensing"
    let ISFJ = "Introverted Sensing with Extraverted Feeling"
    let INTP = "Introverted Intuiting with Extraverted Intuiting"
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
    var WAVal1 = UserDefaults.standard.string(forKey: "WA")
    var QTVal1 = UserDefaults.standard.string(forKey: "QT")
    var RGVal1 = UserDefaults.standard.string(forKey: "RG")
    var ASVal1 = UserDefaults.standard.string(forKey: "AS")
    var PTVal1 = UserDefaults.standard.string(forKey: "PT")

    var body: some View {
        ScrollView{
             VStack {
                Text("Your Personality Type: \(UserDefaults.standard.string(forKey: "personalitytype") ?? " ")").fontWeight(.bold)
                 //Filler code for now
                //Text(ENFP).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Divider()
         //This is details. Maybe this could be done with navigation to get description details?
            }
            VStack {
                Group{
                    Text("Your Love Languages").fontWeight(.bold)
                    /*Text("Words of Affirmation:")
                        .fontWeight(.bold)
                    Text("\(WAVal1!)")
                        .font(Font.system(size: 16))
                        //.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        //.frame(height: 50)
                    Text("Quality Time:")
                        .fontWeight(.bold)
                    Text("\(QTVal1!)")
                        .font(Font.system(size: 16))
                        //.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        //.frame(height: 50)
                    Text("Receiving Gifts:")
                        .fontWeight(.bold)
                    Text("\(RGVal1!)")
                        .font(Font.system(size: 16))
                        //.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        //.frame(height: 50)
                    Text("Acts of Service:")
                        .fontWeight(.bold)
                    Text("\(ASVal1!)")
                        .font(Font.system(size: 16))
                        //.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        //.frame(height: 50)
                    Text("Physical Touch:")
                        .fontWeight(.bold)
                    Text("\(PTVal1!)")
                        .font(Font.system(size: 16))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .frame(height: 50)*/
                }
                Text("")
                Group {
                    Text("Physical Touch:")
                        .fontWeight(.bold)
                    Text("\(PTVal1!)")
                        .font(Font.system(size: 16))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .frame(height: 50)
                }
                Divider()
                Group {
                    Text("Acts of Service:")
                        .fontWeight(.bold)
                    Text("\(ASVal1!)")
                        .font(Font.system(size: 16))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .frame(height: 50)
                }
            }
            VStack {
                Divider()
                Group {
                    Text("Receiving Gifts:")
                        .fontWeight(.bold)
                    Text("\(RGVal1!)")
                        .font(Font.system(size: 16))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .frame(height: 50)
                }
                Divider()
                Group {
                    Text("Quality Time:")
                        .fontWeight(.bold)
                    Text("\(QTVal1!)")
                        .font(Font.system(size: 16))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .frame(height: 50)
                }
                Divider()
                Group {
                    Text("Words of Affirmation:")
                        .fontWeight(.bold)
                    Text("\(WAVal1!)")
                        .font(Font.system(size: 16))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .frame(height: 50)
                }
            }
                /*Divider()
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
                        
                }*/
        }
    }
}

struct QuizResultsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultsView()
    }
}
