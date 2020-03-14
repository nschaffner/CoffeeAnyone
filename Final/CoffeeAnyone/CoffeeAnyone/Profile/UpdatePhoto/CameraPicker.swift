//
//  CameraPicker.swift
//  CoffeeAnyone
//
//  Created by Nick Schaffner on 2/24/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI
import Firebase

class CameraPickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //https://www.hackingwithswift.com/books/ios-swiftui/importing-an-image-into-swiftui-using-uiimagepickercontroller
    //https://www.iosapptemplates.com/blog/swiftui/photo-camera-swiftui
    //https://www.youtube.com/watch?v=W60nnRFUGaI
    @Binding var isShown: Bool
    @Binding var image: Image?
    @Binding var text: Text?
    let options = VisionFaceDetectorOptions()
    lazy var vision = Vision.vision()
    
    init(isShown: Binding<Bool>, image: Binding<Image?>, text: Binding<Text?>) {
        _isShown = isShown
        _image = image
        _text = text
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        let randomInt = Int.random(in: 1...100000)
        //let urlString = "profilePics/\(randomInt).jpg"
        print(randomInt)
        if (UserDefaults.standard.string(forKey: "photo_url") == nil) {
            UserDefaults.standard.set(randomInt, forKey: "photo_url")
        }
        //UserDefaults.standard.set(urlString, forKey: "photo_url")
        let storedURL = UserDefaults.standard.string(forKey: "photo_url")
        print(storedURL!)
        
        //https://www.youtube.com/watch?v=zfJtgq609EE
        let storage = Storage.storage()
        
        storage.reference(withPath: "profilePics/\(storedURL!).jpg").putData(uiImage.jpegData(compressionQuality: 0.75)!, metadata: nil) { (_, err) in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            print("Success")
        }
        
        options.performanceMode = .fast
        //options.landmarkMode = .all
        //options.classificationMode = .all
        //https://firebase.google.com/docs/ml-kit/ios/detect-faces
        //https://www.appcoda.com/mlkit/
        let savedImage = uiImage
        let faceDetector = vision.faceDetector(options: options)
        let newImage = VisionImage(image: savedImage)
        //var newText = "Face Detected"
        //var count = 1
        faceDetector.process(newImage) { faces, error in
            guard error == nil, let faces = faces, !faces.isEmpty else {
                print("No Face Detected")
                //newText = "No Face Detected"
                self.text = Text("")
                return
            }
            print("Face Detected")
            self.text = Text("")
        }
        
        image = Image(uiImage: savedImage)
        isShown = false
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
    
}

struct CameraPicker: UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    @Binding var text: Text?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraPicker>) {
        
    }
    
    func makeCoordinator() -> CameraPickerCoordinator {
        return CameraPickerCoordinator(isShown: $isShown, image: $image, text: $text)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraPicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
}

