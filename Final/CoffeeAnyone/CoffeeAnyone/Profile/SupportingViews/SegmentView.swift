//
//  GYSegmentView.swift
//  Landmarks
//
//  Created by alexyang on 2019/6/6.
//  Copyright © 2019 Apple. All rights reserved.
//
import UIKit
import SwiftUI

struct SegmentView : UIViewRepresentable {
    func makeCoordinator() -> SegmentView.Coordinator {
        Coordinator(self)
    }
   
    var titles:[String]
    @Binding var currentPage: Int
    func makeUIView(context: Context) -> UISegmentedControl
    {
        let segment = UISegmentedControl(items: titles)
        segment.addTarget(context.coordinator, action:#selector(Coordinator.updateCurrentPage(sender:)) , for: .valueChanged)
         print(segment.selectedSegmentIndex)
        return segment
    }
    
    func updateUIView(_ segment: UISegmentedControl, context: Context) {
        segment.selectedSegmentIndex = currentPage
      //  switch segmentedControl.selectedSegmentIndex {
     //       case 0:
      //          ProfileView.isHidden = true
       //         ProfileView.isHidden = false
       //     case 1:
      //        PreferencesView.isHidden = false
       //       PreferencesView.isHidden = true
      //      case 1:
      //          QuizResultsView.isHidden = false
      //          PreferencesView.isHidden = true
      //    default:
      //        break;
      //    }//
    }
    
    class Coordinator: NSObject {
        var control: SegmentView
        
        init(_ control: SegmentView) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UISegmentedControl) {
            control.currentPage = sender.selectedSegmentIndex
              print(control.currentPage)
            print(sender.selectedSegmentIndex)
            
        }
    }
}

#if DEBUG
struct SegmentView_Previews : PreviewProvider {
    static var previews: some View {
        SegmentView(titles: ["Basics","Your Preferences","Match Settings"], currentPage: .constant(0))
    }
}
#endif
