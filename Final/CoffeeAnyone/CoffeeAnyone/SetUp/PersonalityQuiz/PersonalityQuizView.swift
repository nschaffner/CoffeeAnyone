//
//  PersonalityQuizView.swift
//  datingapp_SwiftUI
//
//  Created by Carrie Davis on 1/18/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI


struct PersonalityQuizView: View {
    @ObservedObject var personalityquiz = PersonaltyQuiz()
    @State var showingResults = false
    @State var isDone = false
    @State var length: Float = 3

    var body: some View {
    NavigationView {
     HStack {
        VStack(spacing: 20) {
            HStack {
                Text("Personality Quiz").font(.largeTitle)
                
            }
            Text("Which statement better describes you?")
                .padding(.horizontal,10)
     
            HStack {
                Text(personalityquiz.currentQuestion.lefttext).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Divider().padding(3)
                    .frame(width: 30, height: 60, alignment: .center)
                Text(personalityquiz.currentQuestion.righttext).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
            HStack {
                Text("1")
                Slider(value: $length, in: 1...5, step: 1).padding()
                Text("5")
                    
            }.padding(.horizontal, 10)
            .background(Capsule().stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal,10)
            Text("Move the slider towards the statement that best describes you. Choosing three means you can be decribed best as either statement. ")
                .padding(.horizontal,10)
                .lineLimit(3)
            Text("Currently Selected: \(Int(length))")
            
            Button(action: {
                self.personalityquiz.setAnswer(id: self.personalityquiz.currentQuestion.id, answer: self.length)
                if self.personalityquiz.personalitytype != "" {
                    self.showingResults.toggle()
                }
            }) {
                Text("Submit")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(width: 350, height: 60, alignment: .center)
                    .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                    .cornerRadius(10)
                }
            .padding()
            .sheet(isPresented: $showingResults, onDismiss: {
                //go to main page
                self.isDone = true
            })
                  {
                    PersonalityResultsView(personalityquiz: self.personalityquiz)
                  }
          
                    //MARK: - NAVIGATION LINKS
                  NavigationLink(destination: PersonalityQuizView(), isActive: $isDone) {
                                     EmptyView()
                                 }
            }
        }
        }.navigationBarBackButtonHidden(true)
    }
}
   
struct PersonalityQuizView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityQuizView()
    }
}

