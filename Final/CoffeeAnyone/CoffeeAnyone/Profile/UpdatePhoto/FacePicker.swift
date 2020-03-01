//
//  FacePicker.swift
//  CoffeeAnyone
//
//  Created by Nick Schaffner on 2/27/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI
import UIKit
import Firebase

class FaceViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultView: UITextView!
    let imagePicker = UIImagePickerController()
    let options = VisionFaceDetectorOptions()
    lazy var vision = Vision.vision()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
        options.performanceMode = .accurate
        options.landmarkMode = .all
        options.classificationMode = .all
        options.minFaceSize = CGFloat(0.1)
    }
    
    @IBAction func uploadImage(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
//let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            imageView.image = pickedImage
            let faceDetector = vision.faceDetector(options: options)
            let visionImage = VisionImage(image: pickedImage)
            self.resultView.text = ""
            //1
            faceDetector.process(visionImage) { (faces, error) in
                //2
                guard error == nil, let faces = faces, !faces.isEmpty else {
                    self.dismiss(animated: true, completion: nil)
                    self.resultView.text = "No Face Detected"
                    return
                }
                //3
                self.resultView.text = self.resultView.text + "I see \(faces.count) face(s).\n\n"
                
                for face in faces {
                    //4
                    if face.hasLeftEyeOpenProbability {
                        if face.leftEyeOpenProbability < 0.4 {
                            self.resultView.text = self.resultView.text + "The left eye is not open!\n"
                        } else {
                            self.resultView.text = self.resultView.text + "The left eye is open!\n"
                        }
                    }
                    
                    if face.hasRightEyeOpenProbability {
                        if face.rightEyeOpenProbability < 0.4 {
                            self.resultView.text = self.resultView.text + "The right eye is not open!\n"
                        } else {
                            self.resultView.text = self.resultView.text + "The right eye is open!\n"
                        }
                    }
                    
                    //5
                    if face.hasSmilingProbability {
                        if face.smilingProbability < 0.3 {
                            self.resultView.text = self.resultView.text + "This person is not smiling.\n\n"
                        } else {
                            self.resultView.text = self.resultView.text + "This person is smiling.\n\n"
                        }
                    }
                }
            }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}

struct FacePicker: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<FacePicker>) {
        
    }
    
    func makeCoordinator() -> FaceViewController{
        FaceViewController()
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<FacePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
}
