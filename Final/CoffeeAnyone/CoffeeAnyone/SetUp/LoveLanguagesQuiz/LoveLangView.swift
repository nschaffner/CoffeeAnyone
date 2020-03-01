//
//  LoveLangView.swift
//  CoffeeAnyone
//
//  Created by Nick Schaffner on 2/5/20.
//  Copyright © 2020 Nick Schaffner. All rights reserved.
//

import SwiftUI

struct LoveLangView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var lovelangquiz = LoveLangQuiz()
    @State var showingResults = false
    @State var answer: Float = 2
    var body: some View {
     HStack {
        VStack(spacing: 20) {
            HStack {
                Text("The 5 Love Languages Quiz").font(.largeTitle)
                    .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
            }
            Text("Read and select the statement that best defines what is most meaningful to you in your relationships with others.")
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
     
            VStack {
                Button(action: {
                    self.answer = 1
                    self.lovelangquiz.setAnswer(id: self.lovelangquiz.currentQuestion.id, answer: self.answer)
                    if self.lovelangquiz.lovelanguagetype != "" {
                        self.showingResults.toggle()
                    }
                    }) {
                    Text(lovelangquiz.currentQuestion.lefttext)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 100, alignment: .center)
                        .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                        .cornerRadius(10)
                }.padding()
                Button(action: {
                    self.answer = 2
                        self.lovelangquiz.setAnswer(id: self.lovelangquiz.currentQuestion.id, answer: self.answer)
                        if self.lovelangquiz.lovelanguagetype != "" {
                            self.showingResults.toggle()
                        }
                    }) {
                        Text(lovelangquiz.currentQuestion.righttext)
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
                //go to main page
                self.presentationMode.wrappedValue.dismiss()
            })
                  {
                    lovelanguageResultsView(lovelanguagequiz: self.lovelangquiz)
                  }
        }
            }
        }
}

struct LoveLangView_Previews: PreviewProvider {
    static var previews: some View {
        LoveLangView()
    }
}
