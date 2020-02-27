//
//  lovelanguageQuiz.swift
//  loveLanguages_SwiftUI
//
//  Created by Nick Schaffner on 2/5/20.
//  Copyright © 2020 Nick Schaffner. All rights reserved.
//

import SwiftUI


struct lovelanguageQuizView: View {
    @ObservedObject var lovelanguagequiz = lovelanguageQuiz()
    @State var showingResults = false
    @State var isDone = false
    @State var length: Float = 2

    var body: some View {
    NavigationView {
     HStack {
        VStack(spacing: 20) {
            HStack {
                Text("The 5 Love Languages Quiz").font(.largeTitle)
                    .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
            }
            Text("Read each pair of statement and select the statement that best defines what is most meaningful to you in your relationships with others. Both statements may or may not sound like they fit your situation, but please choose the statement that captures the essence of what is (or would be) most meaningful to you, the majority of the time.")
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
     
            VStack {
                Button(action: {
                    self.length = 1
                    self.lovelanguagequiz.setAnswer(id: self.lovelanguagequiz.currentQuestion.id, answer: self.length)
                    if self.lovelanguagequiz.lovelanguagetype != "" {
                        self.showingResults.toggle()
                    }
                    }) {
                    Text(lovelanguagequiz.currentQuestion.lefttext)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 100, alignment: .center)
                        .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                        .cornerRadius(10)
                }.padding()
                Button(action: {
                    self.length = 2
                        self.lovelanguagequiz.setAnswer(id: self.lovelanguagequiz.currentQuestion.id, answer: self.length)
                        if self.lovelanguagequiz.lovelanguagetype != "" {
                            self.showingResults.toggle()
                        }
                    }) {
                        Text(lovelanguagequiz.currentQuestion.righttext)
                            .padding()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            //.font(.title)
                            .frame(width: 350, height: 100, alignment: .center)
                            .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                            .cornerRadius(10)
                }.padding()
            }
            .padding()
            .sheet(isPresented: $showingResults, onDismiss: {
                self.isDone = true
            })
                  {
                    lovelanguageResultsView(lovelanguagequiz: self.lovelanguagequiz)
                  }
          
                  NavigationLink(destination: lovelanguageQuizView(), isActive: $isDone) {
                                     EmptyView()
                                 }
            }
        }
        }//.navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
   
struct lovelanguageQuizView_Previews: PreviewProvider {
    static var previews: some View {
        lovelanguageQuizView()
    }
}
