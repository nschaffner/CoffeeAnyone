//
//  lovelanguageQuiz.swift
//  loveLanguages_SwiftUI
//
//  Created by Nick Schaffner on 2/5/20.
//  Copyright © 2020 Nick Schaffner. All rights reserved.
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

final class lovelanguageQuiz: ObservableObject, Identifiable {
    private var index = 0
    @Published var completed = false
    @Published var currentQuestion = Question(id: 0, lefttext: "",righttext: "", answer: 99)
    @Published var lovelanguagetype:String = ""
    //@Published var One:String = ""
    @Published var WA:String = ""
    @Published var QT:String = ""
    @Published var RG:String = ""
    @Published var AS:String = ""
    @Published var PT:String = ""
    
    
    //Arrays for questions and answers
    @Published var questions = [
        Question(id: 0, lefttext: "Someone I love send me a loving note/text/email for no special reason", righttext: "I hug someone I love", answer: 99.0),
        Question(id: 1, lefttext: "I can spend alone time with someone i love - just us", righttext: "Someone I love does something practical to help me out", answer: 99.0),
        Question(id: 2, lefttext: "Someone I love gives me a little gift as a toekn of our love of concern for each other", righttext: "I get to spend uninterrupted leisure time with those I love", answer: 99.0),
        Question(id: 3, lefttext: "Someone I love does something uexpected for me to help me with a project", righttext: "I can share an innocent touch with someone I love", answer: 99.0),
         Question(id: 4, lefttext: "Someone I love puts their arm around me in public", righttext: "Someone surprises me with a gift", answer: 99.0),
         Question(id: 5, lefttext: "I'm around someone I love, even if we're not really doing anything", righttext: "I can be comfortable holding hands, high-fiving, or putting my arm around someone I love", answer: 99.0),
         Question(id: 6, lefttext: "I receive a gift from someone I love", righttext: "I hear from someone I love that they love me", answer: 99.0),
         Question(id: 7, lefttext: "I sit close to someone I love", righttext: "I am complimented by someone I love for no apparent reason", answer: 99.0),
         Question(id: 8, lefttext: "I get the chance to just hangout with someone I love", righttext: "I unexpectedly get small gifts from someone I love", answer: 99.0),
         Question(id: 9, lefttext: "I hear someone I love tell me they're proud of me", righttext: "Someone I love helps me with a task", answer: 99.0),
         Question(id: 10, lefttext: "I get to do things with someone I love", righttext: "I hear supportive words from someone I love", answer: 99.0),
         Question(id: 11, lefttext: "Someone I love does things for me instead of just talking about doing nice things", righttext: "I feel connected to someone I love through a hug", answer: 99.0),
         Question(id: 12, lefttext: "I hear praise from someone I love", righttext: "Someone I love gives me something that shows they were really thinking about me", answer: 99.0),
         Question(id: 13, lefttext: "I'm about to just be around someone I love", righttext: "I get a back rub from someone I love", answer: 99.0),
         Question(id: 14, lefttext: "Someone I love reacts positively to something I've accomplished", righttext: "Someone I love does something for me that I know they don't particularly enjoy", answer: 99.0),
         Question(id: 15, lefttext: "I'm able to be in close physical proximity to someone I love", righttext: "I sense someone I love showing interest in the things I care about", answer: 99.0),
         Question(id: 16, lefttext: "Someone I love works on special project with me that I have to complete", righttext: "Someone I love gives me an exiciting gift", answer: 99.0),
         Question(id: 17, lefttext: "I'm complimented by someone I love on my appearance", righttext: "Someone I love takes the time to listen to me and really understands my feelings", answer: 99.0),
         Question(id: 18, lefttext: "I can share a meaningful touch in public with someone I love", righttext: "Someone I love offers to run errands for me", answer: 99.0),
         Question(id: 19, lefttext: "Someone I love does something special for me to help me out", righttext: "I get a gift that someone I love put thought into choosing", answer: 99.0),
         Question(id: 20, lefttext: "Someone I love doesn't check their phone while we're talking with each other", righttext: "Someone I love goes out of their way to do something that relieves pressure on me", answer: 99.0),
         Question(id: 21, lefttext: "I can look forward to a holiday because I'll probably get a gift from someone I love", righttext: "I hear the words 'Iappreciate you' from someone I love", answer: 99.0),
         Question(id: 22, lefttext: "Someone I love and haven't seen in a while thinks enough of me to get me a little gift", righttext: "Someone I love takes care of something I'm responsible to do that I feel too stressed to do at the time", answer: 99.0),
         Question(id: 23, lefttext: "Someone I love doesn't interrupt me while I'm talking", righttext: "Gift giving is an important part of the relationship with someone I love", answer: 99.0),
         Question(id: 24, lefttext: "Someone I love helps me out when they know I'm already tired", righttext: "I get to go somewhere while spending with someone I love", answer: 99.0),
         Question(id: 25, lefttext: "Someone I love touches my arm or shoulder to show their care or concern", righttext: "Someone I love gives me a little gift that they picked up in the course of their normal day", answer: 99.0),
         Question(id: 26, lefttext: "Someone I love says something encouraging to me", righttext: "I get to spend time in a shared activity or hobby with someone I love", answer: 99.0),
         Question(id: 27, lefttext: "Someone I love surprises me with a small token of their appreciation", righttext: "I'm touching someone I love frequently to express our friendship", answer: 99.0),
         Question(id: 28, lefttext: "Someone I love helps me out - especially if I know they're already busy", righttext: "I hear someone I love tell me that they appreciate me", answer: 99.0),
          Question(id: 29, lefttext: "I get a hug from someone who I haven't seen in a while", righttext: "I hear someone I love tell me how much I mean to him/her", answer: 99.0),
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
        if self.index < 30 {
            
            currentQuestion = questions[self.index]
            self.index += 1
        }
        else {
            self.lovelanguagetype = calculatelovelanguage()
        }
    }
    func calculatelovelanguage() -> String {
        var WAcalc:Int
        var QTcalc:Int
        var RGcalc:Int
        var AScalc:Int
        var PTcalc:Int
        var strWA:String
        var strQT:String
        var strRG:String
        var strAS:String
        var strPT:String
        var strTotal:String
        
        WAcalc = 0
        QTcalc = 0
        RGcalc = 0
        AScalc = 0
        PTcalc = 0
        
        if questions[0].answer == 1 {
            WAcalc += 1
        }
        else {
            PTcalc += 1
        }
        if questions[1].answer == 1 {
            QTcalc += 1
        }
        else {
            AScalc += 1
        }
        if questions[2].answer == 1 {
            RGcalc += 1
        }
        else {
            QTcalc += 1
        }
        if questions[3].answer == 1 {
            AScalc += 1
        }
        else {
            PTcalc += 1
        }
        if questions[4].answer == 1 {
            PTcalc += 1
        }
        else {
            RGcalc += 1
        }
        if questions[5].answer == 1 {
            QTcalc += 1
        }
        else {
            PTcalc += 1
        }
        if questions[6].answer == 1 {
            RGcalc += 1
        }
        else {
            WAcalc += 1
        }
        if questions[7].answer == 1 {
            PTcalc += 1
        }
        else {
            WAcalc += 1
        }
        if questions[8].answer == 1 {
            QTcalc += 1
        }
        else {
            RGcalc += 1
        }
        if questions[9].answer == 1 {
            WAcalc += 1
        }
        else {
            AScalc += 1
        }
        if questions[10].answer == 1 {
            QTcalc += 1
        }
        else {
            WAcalc += 1
        }
        if questions[11].answer == 1 {
            AScalc += 1
        }
        else {
            PTcalc += 1
        }
        if questions[12].answer == 1 {
            WAcalc += 1
        }
        else {
            RGcalc += 1
        }
        if questions[13].answer == 1 {
            QTcalc += 1
        }
        else {
            PTcalc += 1
        }
        if questions[14].answer == 1 {
            WAcalc += 1
        }
        else {
            AScalc += 1
        }
        if questions[15].answer == 1 {
            PTcalc += 1
        }
        else {
            QTcalc += 1
        }
        if questions[16].answer == 1 {
            AScalc += 1
        }
        else {
            RGcalc += 1
        }
        if questions[17].answer == 1 {
            WAcalc += 1
        }
        else {
            QTcalc += 1
        }
        if questions[18].answer == 1 {
            PTcalc += 1
        }
        else {
            AScalc += 1
        }
        if questions[19].answer == 1 {
            AScalc += 1
        }
        else {
            RGcalc += 1
        }
        if questions[20].answer == 1 {
            QTcalc += 1
        }
        else {
            AScalc += 1
        }
        if questions[21].answer == 1 {
            RGcalc += 1
        }
        else {
            WAcalc += 1
        }
        if questions[22].answer == 1 {
            RGcalc += 1
        }
        else {
            AScalc += 1
        }
        if questions[23].answer == 1 {
            QTcalc += 1
        }
        else {
            RGcalc += 1
        }
        if questions[24].answer == 1 {
            AScalc += 1
        }
        else {
            QTcalc += 1
        }
        if questions[25].answer == 1 {
            PTcalc += 1
        }
        else {
            RGcalc += 1
        }
        if questions[26].answer == 1 {
            WAcalc += 1
        }
        else {
            QTcalc += 1
        }
        if questions[27].answer == 1 {
            RGcalc += 1
        }
        else {
            PTcalc += 1
        }
        if questions[28].answer == 1 {
            AScalc += 1
        }
        else {
            WAcalc += 1
        }
        if questions[29].answer == 1 {
            PTcalc += 1
        }
        else {
            WAcalc += 1
        }
        
        strWA = String(WAcalc)
        strQT = String(QTcalc)
        strRG = String(RGcalc)
        strAS = String(AScalc)
        strPT = String(PTcalc)
        
        strTotal = strWA + strQT + strRG + strAS + strPT
        
        print(strWA, strQT, strRG, strAS, strPT)
        print(strTotal)
        
        //self.One = "True"
        self.WA = strWA
        self.QT = strQT
        self.RG = strRG
        self.AS = strAS
        self.PT = strPT
        
        print(self.WA)

        return self.WA + self.QT + self.RG + self.AS + self.PT
    }
    
}
