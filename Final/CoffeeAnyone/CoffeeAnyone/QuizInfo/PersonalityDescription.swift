//
//  PersonalityDescription.swift
//  CoffeeAnyone
//
//  Created by Nick Schaffner on 3/9/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import Foundation
import SwiftUI

struct PersonalityDescription: View {
    var personalityScore = UserDefaults.standard.string(forKey: "personalitytype")
    
    var body: some View {
        //ScrollView {
        NavigationView {
            VStack {
                Image("personality")
                Group{
                    Text("Personality Types").fontWeight(.bold)
                        .font(.title)
                    //Text("")
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(10)
                        .multilineTextAlignment(.center)
                    Text("Your personality type is:").fontWeight(.bold)
                        .padding(10)
                    Text("\(personalityScore!)").fontWeight(.semibold)
                        .padding(.bottom, 10)
                }
                HStack {
                    Group{
                        NavigationLink(destination: ISTJDescView()) {
                            Text("ISTJ").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: ISFJDescView()) {
                            Text("ISFJ").fontWeight(.bold)
                            .fixedSize()
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: INFJDescView()) {
                            Text("INFJ").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: INTJDescView()) {
                            Text("INTJ").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                }
                HStack {
                    Group{
                        NavigationLink(destination: ISTPDescView()) {
                            Text("ISTP").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: ISFPDescView()) {
                            Text("ISFP").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: INFPDescView()) {
                            Text("INFP").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: INTPDescView()) {
                            Text("INTP").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                }
                HStack {
                    Group{
                        NavigationLink(destination: ESTPDescView()) {
                            Text("ESTP").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: ESFPDescView()) {
                            Text("ESFP").fontWeight(.bold)
                            .fixedSize()
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: ENFPDescView()) {
                            Text("ENFP").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: ENTPDescView()) {
                            Text("ENTP").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                }
                HStack {
                    Group{
                        NavigationLink(destination: ESTJDescView()) {
                            Text("ESTJ").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: ESFJDescView()) {
                            Text("ESFJ").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: ENFJDescView()) {
                            Text("ENFJ").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                    Group{
                        NavigationLink(destination: ENTJDescView()) {
                            Text("ENTJ").fontWeight(.bold)
                            .padding(10)
                        }
                    }
                }
            }
        }
    }
}

struct ISTJDescView: View {
    var body: some View {
        VStack {
            Image("inspector")
            Text("ISTJ: The Inspector").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Introversion + Sensing + Thinking + Judging").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being detail-oriented, realistic, present-focused, observant, logical, practical, orderly and organized.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being judgmental, subjective and insensitive. ISTJs also have a tendency to blame others.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("While ISTJs may experience deep feelings, they often struggle to show that side of themselves in romantic relationships. You can be an understanding partner by not expecting them to bare their soul to you right off the bat. Sometimes it may seem that your partner is not considering your feelings, but you can help them see your side by rationally presenting facts and logical explanations for your side of the argument.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ISFJDescView: View {
    var body: some View {
        VStack {
            Image("protector")
            Text("ISFJ: The Protector").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Introversion + Sensing + Feeling + Judging").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being reliable, practical and sensitive. ISFJs also have an eye for detail.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include disliking abstract concepts, avoiding confrontation, disliking change and neglecting one's own needs.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("ISFJs are very faithful to their partners and approach relationships with an intensity of emotion and great devotion. While they have strong feelings, they are not always good at expressing them. Your ISFJ partner may often be focused on taking care of your needs, but you should take care to reciprocate these actions. Showing your partner that you appreciate them can help them to feel more satisfied.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct INFJDescView: View {
    var body: some View {
        VStack {
            Image("advocate")
            Text("INFJ: The Advocate").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Introversion + Intuition + Feeling + Judging").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being senstive to the needs of others, reserved, highly creative, artistic, focused on the future and idealistic. INFJs also value close, deep relationships and enjoy thinking about the meaning of life.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being overly sensitive, difficult to get to know and stubborn. INFJs also dislike confrontation and can have high expectations.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("INFJs have an innate ability to understand other people's feelings and enjoy being in close, intimate relationships. They tend to flourish best in romantic relationships with people who they share their core values. As a partner, it is important to provide the support and emotional intimacy that an INFJ craves.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct INTJDescView: View {
    var body: some View {
        VStack {
            Image("architect")
            Text("INTJ: The Architect").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Introversion + Intuition + Thinking + Judging").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being self-confident, hardworking and good at listening. INTJs enjoy theoretical and abstract concepts, have high expectations and take criticism well.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being judgmental, overly analystical and  perfectionistic. INTJs dislike talking about emotions and can sometimes seem callous or insensitive.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("INTJs can be difficult to get to know so romantic relationships can sometimes falter. If your partner has this personality type, it is important to know that loyalty and understanding are important. Don't be afraid to show that you are dedicated to your INTJ partner, but also don't pressure them to spill their emotions. Communication is also critical.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ISTPDescView: View {
    var body: some View {
        VStack {
            Image("crafter")
            Text("ISTP: The Crafter").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Introversion + Sensing + Thinking + Perceiving").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being logical, action-oriented, realistic, practical, self-confident and easy-going. ISTPs also learn from experience and enjoy new things.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being insensitive and difficult to get to know. ISTPs are also risk-takers, grow bored easily and do not like commitment.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Because ISTPs live so strongly in the present moment, long-term commitments can be a real challenge. You can strengthen your relationship with your ISTP partner by being willing to take things day to day and by respecting their fierce need for independence.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ISFPDescView: View {
    var body: some View {
        VStack {
            Image("artistic")
            Text("ISFP: The Artistic").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Introversion + Sensing + Feeling + Perceiving").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being pratical, aware of their environment and loyal to values and beliefs. ISFPs also enjoy hands-on learning.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include disliking abstract concepts, theoretical information, arguments and conflicts. ISFPs also are reserved, quiet and need personal space.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("ISFPs are very considerate in relationships, often to the point that they will continually defer to their partner. As they are usually not good at expressing their own feelings and needs, it is important that you make an effort to understand your partner.When making decisions, ensure that your partner's voice is heard and his or her feelings are given equal weight.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct INFPDescView: View {
    var body: some View {
        VStack {
            Image("mediator")
            Text("INFP: The Mediator").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Introversion + Intuition + Feeling + Perceiving").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being loyal, devoted, sensitive to feelings, caring and interested in others and good at seeing the big picture. INFPs also work well alone and value close relationships.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being overly idealistic and difficult to get to know. INFPs also tend to take everything personally and overlook details.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("INFPs may struggle to become close to potential romantic partners. Once they do form a relationship, they approach it with a strong sense of loyalty. They can sometimes hold overly romanticized views of relationships and may have excessively high expectations that their partners struggle to live up to. They also tend to take comments personally while also avoiding conflicts.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct INTPDescView: View {
    var body: some View {
        VStack {
            Image("thinker")
            Text("INTP: The Thinker").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Introversion + Intuition + Thinking + Perceiving").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being logical, objective independent and an abstract thinker. INTPs are also loyal and affectionate with loved ones.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being insensitive, prone to self-doubt and difficult to get to know. INTPs also struggle to follow rules and have trouble expressing feelings.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("INTPs tend to live inside their minds, so they can be quite difficult to get to know. Even in romance, they often hold back until they feel that the other person has proven themselves worthy of hearing these innermost thoughts and feelings. Be honest and forthright. INTPs also struggle to share their own feelings, so pay attention to subtle signals.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ESTPDescView: View {
    var body: some View {
        VStack {
            Image("persuader")
            Text("ESTP: The Persuader").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Extraversion + Sensing + Thinking + Perceiving").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being gregarious, funny, energetic, influential, persuasive, action-oriented, adaptable, resourceful and observant.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being impulsive, competitive, dramatic and insensitive. ESTPs also easily bored.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("ESTPs are exciting and fun-loving, but they can grow bored with routines quickly. They do not enjoy long, philosophical discussions but like to keep the conversation flowing as they talk about shared interests and passions. Be aware that your partner prefers to take things day by day, may struggle with making long-term commitments, and has a hard time making plans for the future.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ESFPDescView: View {
    var body: some View {
        VStack {
            Image("performer")
            Text("ESFP: The Performer").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Extraversion + Sensing + Feeling + Perceiving").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being optimistic, gregarious, focused on the present, practical and spontaneous. ESFPs also enjoy people and socializing.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include disliking abstract theories and becoming bored easily. ESFPs also do not plan ahead and are implusive.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("ESFPs tend to be honest and forthright in relationships. They don't play games and are warm and enthusiastic in romantic relationships. One thing to remember is that ESFPs dislike conflict and tend to take any critical comments quite personally. While it is important to be straightforward in your relationship with an ESFP, try to avoid being overly harsh or confrontational.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ENFPDescView: View {
    var body: some View {
        VStack {
            Image("champion")
            Text("ENFP: The Champion").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Extraversion + Intuition + Feeling + Perceiving").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being warm, enthusiastic, empathetic, caring, fun, spontaneous and highly creative. ENFPs also have strong people skills and communication skills.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being disorganized and needing of approval from others. ENFPs also tend to get stressed out easily, can be overly emotional, overthink and struggle to follow rules.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("ENFPs tend to be passionate and enthusiastic in romantic relationships. Long-term relationships can sometimes hit a snag because people with this personality type are always thinking about what is possible rather than simply focusing on things as they are. It is important to bring excitement into the relationship in new ways to keep the romance alive.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ENTPDescView: View {
    var body: some View {
        VStack {
            Image("debator")
            Text("ENTP: The Debator").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Extraversion + Intuition + Thinking + Perceiving").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being innovative and creative. ENTPs also are great conversationalists, enjoy debating and value knowledge.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being unfocused, argumentative and insensitive. ENTPs also dislike being controlled as well as routines and schedules.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("In intimate relationships, ENTPs can be passionate and exciting. They are warm, loving, and good at understanding their partner's needs. You may find that they may struggle to follow through on promises that they have made, which can be a source of frustration at times. Be aware of your ENTP partner's need for spontaneity and help them work toward their goals with enthusiasm.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ESTJDescView: View {
    var body: some View {
        VStack {
            Image("director")
            Text("ESTJ: The Director").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Extraversion + Sensing + Thinking + Judging").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being practical, realistic, dependable, self-confident, hard-working and traditional. ESTJs also possess strong leadership skills.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being insensitive, inflexible, argumentative and bossy. ESTJs are also not good at expressing their feelings.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("ESTJs are dependable and take their commitments seriously. Once they have dedicated themselves to a relationship, they will stay true to it for life. They tend to neglect feelings, which can be difficult for their partners as times. While they may not express their feelings through words, remember that they will often convey their emotions through actions.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ESFJDescView: View {
    var body: some View {
        VStack {
            Image("caregiver")
            Text("ESFJ: The Caregiver").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Extraversion + Sensing + Feeling + Judging").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being kind, loyal, outgoing, organized, pratical and dependable. ESFJs also enjoy helping others.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being needy, approval-seeking and sensitive to criticism.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("In romance, ESFJs are very devoted, supportive, and loyal. They are not interested in casual relationships and are focused on developing long-term commitments. You can support your partner by showing how much you love and appreciate them. Being responsive by showing affection and returning gestures of love is important.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ENFJDescView: View {
    var body: some View {
        VStack {
            Image("giver")
            Text("ENFJ: The Giver").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Extraversion + Intuition + Feeling + Judging").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being outgoing, warm-hearted, empathetic, encouraging and organized. ENFJs also have a wide social circle.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being approval-seeking, overlying sensitive, indecisive and self-sacrificing.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Since ENFJs are so sensitive to the feelings of others, your happiness is critical to your partner's happiness. Remember that your partner may even put their own needs last in order to ensure that your needs are met. Let your ENFJ partner know how much you appreciate all the support and care that they offer and be willing to provide the same support in return – even if he or she struggles to ask for help.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}

struct ENTJDescView: View {
    var body: some View {
        VStack {
            Image("commander")
            Text("ENTJ: The Commander").fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            Text("Extraversion + Intuition + Thinking + Judging").fontWeight(.bold)
                .font(.headline)
                .padding()
            //Text("")
            Text("Strengths").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
                //.font(.subheadline)
                //.frame(alignment: .leading)
                //.padding(10)
                //.multilineTextAlignment(.center)
            Text("Strengths include being self-assured, well-organized, assertive and outspoken. ENTJs also have strong leadership skills, are good at making decisions and have strong communication skills.")
                .padding(10)
                //.multilineTextAlignment(.center)
            Text("Weaknesses").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("Weaknesses include being impatient, stubborn, insensitive, aggressive and intolerant.")
                .padding(10)
                //.multilineTextAlignment(.center)
            //Text("")
            Text("Relationships").fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            Text("An ENTJ partner can often seem quite dominating in a relationship. Dealing with emotions does not come naturally to them so they may seem insensitive to their partner's feelings. It is important to remember that this does not mean that ENTJ’s don’t have feelings — they do need to feel completely comfortable in order to show their emotions.")
                .padding(10)
                //.multilineTextAlignment(.center)
        }
    }
}
