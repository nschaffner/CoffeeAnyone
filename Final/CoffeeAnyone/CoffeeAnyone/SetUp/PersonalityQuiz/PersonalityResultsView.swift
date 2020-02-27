//
//  PersonalityResultsView.swift
//  datingapp_SwiftUI
//
//  Created by Carrie Davis on 1/31/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI
import Combine

struct PersonalityResultsView: View {
    //.jungtype.com
    @ObservedObject var personalityquiz = PersonaltyQuiz()
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
        VStack {
            Text("Your Type: \(personalityquiz.personalitytype)").fontWeight(.bold)
            //Could I use arrays or dict and function yes but maybe in a refactor
            //wish I could just convert my input into a var like in python using formating.
            if personalityquiz.personalitytype == "ISTJ" {
                    Text(ISTJ)
            }else if personalityquiz.personalitytype == "ISTP"{
                    Text(ISTP)
                      
            }else if personalityquiz.personalitytype == "ISFJ"{
                    Text(ISFJ)
                        
            }else if personalityquiz.personalitytype == "ESTJ"{
                    Text(ESTJ)
                       
            }else if personalityquiz.personalitytype == "ESFJ"{
                    Text(ESFJ)
                       
            }else if personalityquiz.personalitytype == "ISFP"{
                    Text(ISFP)
                       
            }else if personalityquiz.personalitytype == "ESTP"{
                    Text(ESTP)
                       
            }else if personalityquiz.personalitytype == "ENFP"{
                    Text(ENFP)
                       
            }else if personalityquiz.personalitytype == "INTJ"{
                    Text(INTJ)
                      
            }else if personalityquiz.personalitytype == "ENTJ"{
                    Text(ENTJ)
                      
            }else if personalityquiz.personalitytype == "ENFJ"{
                    Text(ENFJ)
                      
            }
             Divider()
    //This is details. Maybe this could be done with navigation to get description details?
            if personalityquiz.IE == "I" {
                Group{
                    Text("\(introvert)")
                        .fontWeight(.bold)
                    Text(introvertdesc)
                }
                
            }else if personalityquiz.IE == "E"{
                Group{
                      Text("\(extravert)")
                        .fontWeight(.bold)
                    Text(extraverteddesc)
                }
            }
            Divider()
            if personalityquiz.SN == "N" {
                Group{
                    Text(intuiting)
                        .fontWeight(.bold)
                    Text(intuitdesc)
                }
            }else if personalityquiz.SN == "S"{
                Group{
                    Text(sensing).fontWeight(.bold)
                        .fontWeight(.bold)
                    Text(sensingdesc)
                }
            }
            Divider()
            if personalityquiz.FT == "T" {
                Group{
                    Text(thinking).fontWeight(.bold)
                        .fontWeight(.bold)
                    Text(thinkingdesc)
                }
            }else if personalityquiz.FT == "F"{
                Group{
                    Text(feeling).fontWeight(.bold)
                        .fontWeight(.bold)
                    Text(feelingdesc)
                }
            }
            Divider()
            if personalityquiz.JP == "P" {
                Group{
                    Text(perceiving).fontWeight(.bold)
                        .fontWeight(.bold)
                    Text(perceivedesc)
                }
            }else if personalityquiz.JP == "J"{
                Group{
                    Text(judging).fontWeight(.bold)
                        .font(.subheadline)
                    Text(judgedesc)
                }
            }
        }
    }
}
    

struct PersonalityResultsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityResultsView()
    }
}
