//
//  UpdateMediaView.swift
//  CoffeeAnyone
//
//  Created by Nick Schaffner on 2/24/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct UpdateMediaView: View {
    var body: some View {
        VStack() {
            VStack{
                //Spacer()
                NavigationLink(destination: CameraView()) {
                   EditButton(image:"camera.circle",text:"Camera")
                }
                .padding()
                NavigationLink(destination: GalleryView()) {
                    EditButton(image:"person.2.square.stack",text:"Camera Gallery")
                }
            .padding()
            }.padding()
            //Spacer()
        }
            .navigationBarTitle("Edit Photo")
    }
}

struct CameraView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var text: Text? = nil
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            VStack {
                text
                image?.resizable()
                    .scaledToFit()
                        
                Button("Take Photo") {
                    self.showImagePicker = true
                }
                .padding()
                        
            }.sheet(isPresented: self.$showImagePicker) {
                CameraCaptureView(showImagePicker: self.$showImagePicker, image: self.$image, text: self.$text)
            }
            /*VStack {
                NavigationLink(destination: ProfileView()) {
                   EditButton(image:"camera.circle",text:"Save")
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .padding()*/
            //https://www.hackingwithswift.com/books/ios-swiftui/showing-alert-messages
            VStack {
                Button("Save") {
                    self.showingAlert = true
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text(""), message: Text("Your new profile picture has been saved"), dismissButton: .default(Text("OK")))
                }
                .padding()
            }
        }
    }
}

struct GalleryView: View {

    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var text: Text? = nil
    @State private var showingAlert = false
        
    var body: some View {
        VStack {
            VStack {
                text
                image?.resizable()
                    .scaledToFit()
                        
                Button("Choose Photo") {
                    self.showImagePicker = true
                }
                .padding()
                        
            }.sheet(isPresented: self.$showImagePicker) {
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image, text: self.$text)
            }
            /*VStack {
                    NavigationLink(destination: ProfileView()) {
                       EditButton(image:"camera.circle",text:"Save")
                    }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .padding()*/
            //https://www.hackingwithswift.com/books/ios-swiftui/showing-alert-messages
            VStack {
                Button("Save") {
                    self.showingAlert = true
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text(""), message: Text("Your new profile picture has been saved"), dismissButton: .default(Text("OK")))
                }
                .padding()
            }
        }
    }
}

#if DEBUG
struct UpdateMediaView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateMediaView()
    }
}
#endif
