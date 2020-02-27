//
//  AffirmationView.swift
//  loveLanguages
//
//  Created by Nick Schaffner on 2/22/20.
//  Copyright © 2020 Nick Schaffner. All rights reserved.
//

import Foundation
import SwiftUI

struct WADescriptionView: View {
    var body: some View {
        VStack {
            Text("Words of Affirmation").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Actions don’t always speak louder than words. If this is your love language, unsolicited compliments mean the world to you. Hearing the words, “I love you,” are important— hearing the reasons behind that love sends your spirits skyward. Insults can leave you shattered and are not easily forgotten. You thrive on hearing kind and encouraging words that build you up.")
                .padding(20)
                .multilineTextAlignment(.center)
        }
    }
}

struct QTDescriptionView: View {
    var body: some View {
        VStack {
            Text("Quality Time").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("In Quality Time, nothing says “I love you” like full, undivided attention. Being there for this type of person is critical, but really being there—with the TV off, fork and knife down, and all chores and tasks on standby—makes you feel truly special and loved. Distractions, postponed activities, or the failure to listen can be especially hurtful. Whether itʼs spending uninterrupted time talking with someone else or doing activities together, you deepen your connection with others through sharing time.")
                .padding(20)
                .multilineTextAlignment(.center)
        }
    }
}

struct RGDescriptionView: View {
    var body: some View {
        VStack {
            Text("Receiving Gifts").fontWeight(.bold)
            .font(.title)
            .foregroundColor(.blue)
            .padding()
            Text("Don’t mistake this love language for materialism; the receiver of gifts thrives on the love, thoughtfulness, and effort behind the gift. If you speak this language, the perfect gift or gesture shows that you are known, you are cared for, and you are prized above whatever was sacrificed to bring the gift to you. A missed birthday or a hasty, thoughtless gift would be disastrous—so would the absence of everyday gestures. Gifts are heartfelt symbols to you of someone else's love and affection for you.")
                .padding(20)
                .multilineTextAlignment(.center)
        }
    }
}

struct ASDescriptionView: View {
    var body: some View {
        VStack {
            Text("Acts of Service").fontWeight(.bold)
            .font(.title)
            .foregroundColor(.blue)
            .padding()
            Text("Can helping with homework really be an expression of love? Absolutely! Anything you do to ease the burden of responsibilities weighing on an “Acts of Service” person will speak volumes. The words he or she most wants to hear: “Let me do that for you.” Laziness, broken commitments, and making more work for them tell speakers of this language their feelings don’t matter. When others serve you out of love (and not obligation), you feel truly valued and loved.")
                .padding(20)
                .multilineTextAlignment(.center)
        }
    }
}

struct PTDescriptionView: View {
    var body: some View {
        VStack {
            Text("Physical Touch").fontWeight(.bold)
            .font(.title)
            .foregroundColor(.blue)
            .padding()
            Text("A person whose primary language is Physical Touch is, not surprisingly, very touchy. Hugs, pats on the back, and thoughtful touches on the arm—they can all be ways to show excitement, concern, care, and love. Physical presence and accessibility are crucial, while neglect or abuse can be unforgivable and destructive. Appropriate and timely touches communicate warmth, safety, and love to you.")
                .padding(20)
                .multilineTextAlignment(.center)
        }
    }
}
