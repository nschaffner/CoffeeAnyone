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
                Spacer()
                NavigationLink(destination: CameraView()) {
                   EditButton(image:"camera.circle",text:"Camera")
                }
                Spacer()
                NavigationLink(destination: GalleryView()) {
                    EditButton(image:"chevron.down.circle",text:"Camera Gallery")
                }
                Spacer()
            }.padding()
            Spacer()
        }
            .navigationBarTitle("Edit Photo")
    }
}

struct CameraView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var text: Text? = nil
    
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
            VStack {
                NavigationLink(destination: ProfileView()) {
                   EditButton(image:"camera.circle",text:"Save")
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .padding()
        }
    }
}

struct GalleryView: View {

    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var text: Text? = nil
        
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
            VStack {
                    NavigationLink(destination: ProfileView()) {
                       EditButton(image:"camera.circle",text:"Save")
                    }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .padding()
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
