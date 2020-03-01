//
//  CaptureCameraView.swift
//  CoffeeAnyone
//
//  Created by Nick Schaffner on 2/24/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI

struct CameraCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    @Binding var text: Text?
    
    var body: some View {
        CameraPicker(isShown: $showImagePicker, image: $image, text: $text)
    }
}

#if DEBUG
struct CameraCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        CameraCaptureView(showImagePicker: .constant(false), image: .constant(Image("")), text: .constant(Text("")))
    }
}
#endif
