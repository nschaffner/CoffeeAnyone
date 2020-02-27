//
//  ProfileHeaderView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/4/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct ProfileHeaderView: View {
   var name: String
    @State var url = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            VStack(alignment: .center) {
                HStack(alignment: .center){
                    Spacer()
                    //New text begin
                    //https://www.youtube.com/watch?v=PYpTto3iQXU
                    if url != ""{
                        AnimatedImage(url: URL(string: url)!)//.frame(height: 200).cornerRadius(25).padding(10)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                        .shadow(radius: 10)
                        .padding( 10)
                        .frame(height: 200)
                    }
                    else{
                        Downloader()
                    }
                    //New text end
                    //CircleImage(image:Image("youngelvis"))
                    //    .padding( 10)
                    //    .frame(height: 200)
                    Spacer()
                 }

                Text(name)
                .font(.body)
                .bold()
                        
                 .padding(.bottom,10)
                 
             }
            //New text begin
            .onAppear {
                let storage = Storage.storage().reference()
                storage.child("profilePics/1.jpg").downloadURL { (url, err) in
                    
                    if err != nil {
                        
                        print((err?.localizedDescription)!)
                        return
                    }
                    
                    self.url = "\(url!)"
                }
            }
            //Next text end
            //.frame(height: 250)
             .background(Color.white
                 .cornerRadius(10, antialiased: true))
             .shadow(radius: 5)
             .padding(.horizontal, 10)
             .padding(.vertical, 10)
        }
    }
}

struct Downloader: UIViewRepresentable {
    //https://www.youtube.com/watch?v=PYpTto3iQXU
    func makeUIView(context: UIViewRepresentableContext<Downloader>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Downloader>) {
        
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(name: "Ted BillyBob Thorton")
    }
}
