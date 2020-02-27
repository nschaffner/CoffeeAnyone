//
//  PersonalityQuiz.swift
//  datingapp_SwiftUI
//
//  Created by Carrie Davis on 1/18/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI
import Combine

struct Question: Codable, Identifiable {
    var id: Int
    var lefttext: String
    var righttext: String
    var answer: Float
}

extension Question: Equatable {}

final class PersonaltyQuiz: ObservableObject, Identifiable {
    private var index = 0
    @Published var completed = false
    @Published var currentQuestion = Question(id: 0, lefttext: "",righttext: "", answer: 99)
    @Published var personalitytype:String = ""
    @Published var IE:String = ""
    @Published var SN:String = ""
    @Published var JP:String = ""
    @Published var FT:String = ""
    
    
    //Arrays for questions and answers
    @Published var questions = [
        Question(id: 0, lefttext: "makes lists", righttext: "relies on memory", answer: 99.0),
        Question(id: 1, lefttext: "sceptical", righttext: "wants to believe", answer: 99.0),
        Question(id: 2, lefttext: "bored by time alone", righttext: "needs time alone", answer: 99.0),
        Question(id: 3, lefttext: "accepts things as are", righttext: "unsatisfied with how things are", answer: 99.0),
         Question(id: 4, lefttext: "keeps room clean", righttext: "just puts stuff anywhere", answer: 99.0),
         Question(id: 5, lefttext: "thinks \"robotic\" is an insult", righttext: "strives to have a mechanical mind", answer: 99.0),
         Question(id: 6, lefttext: "energetic", righttext: "mellow", answer: 99.0),
         Question(id: 7, lefttext: "prefer to take multiple choice test", righttext: "prefer essay answers", answer: 99.0),
         Question(id: 8, lefttext: "chaotic", righttext: "organized", answer: 99.0),
         Question(id: 9, lefttext: "easily hurt", righttext: "thick-skinned", answer: 99.0),
         Question(id: 10, lefttext: "works best in groups", righttext: "works best alone", answer: 99.0),
         Question(id: 11, lefttext: "focused on the present", righttext: "focused on the future", answer: 99.0),
         Question(id: 12, lefttext: "plans far ahead", righttext: "plans at the last minute", answer: 99.0),
         Question(id: 13, lefttext: "wants people's respect", righttext: "wants their love", answer: 99.0),
         Question(id: 14, lefttext: "gets worn out by parties", righttext: "gets fired up by parties", answer: 99.0),
         Question(id: 15, lefttext: "fits in", righttext: "stands out", answer: 99.0),
         Question(id: 16, lefttext: "keeps options open", righttext: "commits", answer: 99.0),
         Question(id: 17, lefttext: "wants to be good at fixing things", righttext: "wants to be good at fixing people", answer: 99.0),
         Question(id: 18, lefttext: "talks more", righttext: "listens more", answer: 99.0),
         Question(id: 19, lefttext: "when describing an event tells people what happened", righttext: "when describing an event, describes what it means", answer: 99.0),
         Question(id: 20, lefttext: "gets work done right away", righttext: "procrastinates", answer: 99.0),
         Question(id: 21, lefttext: "follows the heart", righttext: "follows the head", answer: 99.0),
         Question(id: 22, lefttext: "stays at home", righttext: "goes out on the town", answer: 99.0),
         Question(id: 23, lefttext: "wants the big picture", righttext: "wants the details", answer: 99.0),
         Question(id: 24, lefttext: "improvises", righttext: "prepares", answer: 99.0),
         Question(id: 25, lefttext: "bases morality on justice", righttext: "bases morality on compassion", answer: 99.0),
         Question(id: 26, lefttext: "finds it difficult to yell very loudly", righttext: "yelling to others when they are far away comes naturally", answer: 99.0),
         Question(id: 27, lefttext: "theoretical, interested in ideas versus practice", righttext: "empirical, relies on observation/experience", answer: 99.0),
         Question(id: 28, lefttext: "works hard", righttext: "plays hard", answer: 99.0),
          Question(id: 29, lefttext: "uncomfortable with emotions", righttext: "values emotions", answer: 99.0),
         Question(id: 30, lefttext: "likes to perform in front of other people", righttext: "avoids public speaking", answer: 99.0),
         Question(id: 31, lefttext: "likes to know who?, what?, when?", righttext: "likes to know why?", answer: 99.0)
       ]
    
    init(){
        getNextQuestion()
    }
    
    func setAnswer(id: Int,answer: Float) {
        self.questions[id].answer = answer
         getNextQuestion()
    }
    //Function which returns a question
    func getNextQuestion() {
        if self.index < 32 {
            
            currentQuestion = questions[self.index]
            self.index += 1
        }
        else {
            self.personalitytype = calculatePersonality()
        }
    }
    func calculatePersonality() -> String {
        var IEcalc:Float
        var SNcalc:Float
        var FTcalc:Float
        var JPcalc:Float
        IEcalc = 30 - questions[2].answer - questions[6].answer - questions[10].answer + questions[14].answer - questions[18].answer + questions[22].answer + questions[26].answer - questions[30].answer
        
        SNcalc = 12 + questions[3].answer + questions[7].answer + questions[11].answer + questions[15].answer + questions[19].answer
        -  questions[23].answer - questions[27].answer + questions[31].answer
        
        FTcalc = 30 - questions[1].answer + questions[5].answer + questions[9].answer - questions[13].answer - questions[17].answer + questions[21].answer - questions[25].answer - questions[29].answer
        
        JPcalc = 18 + questions[0].answer + questions[4].answer - questions[8].answer + questions[12].answer - questions[16].answer
        + questions[20].answer - questions[24].answer + questions[28].answer
        
        if IEcalc > 24 {
            self.IE = "E"
        }
        else {
            self.IE = "I"
            
        }
        if SNcalc > 24 {
            self.SN = "N"
        }
        else {
            self.SN = "S"
        }
        if FTcalc > 24 {
            self.FT = "T"
        }
        else {
            self.FT = "F"
        }
        if JPcalc > 24 {
            self.JP = "P"
        }
        else {
            self.JP = "J"
        }
        return self.IE + self.SN + self.FT + self.JP
    }
    
}
