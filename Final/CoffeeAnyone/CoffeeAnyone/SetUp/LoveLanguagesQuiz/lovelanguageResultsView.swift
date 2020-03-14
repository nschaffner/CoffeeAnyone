//
//  lovelanguageQuiz.swift
//  loveLanguages_SwiftUI
//
//  Created by Nick Schaffner on 2/5/20.
//  Copyright © 2020 Nick Schaffner. All rights reserved.
//

import SwiftUI
import Combine

struct lovelanguageResultsView: View {
    @ObservedObject var lovelanguagequiz = LoveLangQuiz()
    var body: some View {
        NavigationView {
            VStack {
                Group{
                    Text("Your Love Language Scores").fontWeight(.bold)
                    .font(.title)
                    Text("")
                    Text("The highest score indicates your primary love language. The lower scores indicate those languages you seldom use to communicate love and which probably don’t affect you very much on an emotional level. Tap on each love language to learn more.")
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(20)
                        .multilineTextAlignment(.center)
                }
                Group{
                    Text("")
                    NavigationLink(destination: WADescriptionView()) {
                        Text("Words of Affirmation").fontWeight(.bold)
                    }
                    Text("")
                    Text("\(UserDefaults.standard.string(forKey: "WA")!)")
                }
                Divider()
                Group{
                    NavigationLink(destination: QTDescriptionView()) {
                        Text("Quality Time").fontWeight(.bold)
                    }
                    Text("")
                    Text("\(UserDefaults.standard.string(forKey: "QT")!)")
                }
                Divider()
                Group{
                    NavigationLink(destination: RGDescriptionView()) {
                        Text("Receiving Gifts").fontWeight(.bold)
                    }
                    Text("")
                    Text("\(UserDefaults.standard.string(forKey: "RG")!)")
                }
                Divider()
                Group{
                    NavigationLink(destination: ASDescriptionView()) {
                        Text("Acts of Service").fontWeight(.bold)
                    }
                    Text("")
                    Text("\(UserDefaults.standard.string(forKey: "AS")!)")
                }
                Divider()
                Group{
                    NavigationLink(destination: PTDescriptionView()) {
                        Text("Physical Touch").fontWeight(.bold)
                    }
                    Text("")
                    Text("\(UserDefaults.standard.string(forKey: "PT")!)")
                }
            }
        }
    }
}
    
struct lovelanguageResultsView_Previews: PreviewProvider {
    static var previews: some View {
        lovelanguageResultsView()
    }
}
