//
//  CategoriesView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/27/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI



struct CategoriesView: View {

   @Environment(\.presentationMode) var presentationMode
    @State private var showingSignOn = false
    @State private var showingAlert = false
    var body: some View {
                VStack{
                ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10){
                if UserDefaults.standard.string(forKey: "name") == nil {
                         NavigationLink(destination: ProfileFormView())
                         {
                             CategoryItem(image:"changeprofileimage", text:"Complete Your Basic Profile")
                         }
                     }
                     if UserDefaults.standard.string(forKey: "name") != nil {
                         NavigationLink(destination: ProfileFormView())
                         {
                             CategoryItem(image:"changeprofileimage", text:"Change Existing Profile")
                         }
                     }
                     if UserDefaults.standard.string(forKey: "hobbies1") == nil {
                             NavigationLink(destination: HobbiesFormView())
                             {
                                 CategoryItem(image:"hobbieicon", text:"Add Your Hobbies")
                             }
                         }
                     if UserDefaults.standard.string(forKey: "hobbies1") != nil {
                             NavigationLink(destination: HobbiesFormView())
                             {
                                 CategoryItem(image:"hobbieicon", text:"Change Hobbies")
                             }
                         }
                
                     if UserDefaults.standard.string(forKey: "agePref") != nil {
                         NavigationLink(destination: PrefFormView())
                         {
                             CategoryItem(image:"matches", text:"Change Match Preferences")
                         }
                     }
                     if UserDefaults.standard.string(forKey: "agePref") == nil {
                         NavigationLink(destination: PrefFormView())
                         {
                             CategoryItem(image:"matches", text:"Complete Match Preferences")
                         }
                     }
                  
                     if UserDefaults.standard.string(forKey: "WA") != nil {
                          NavigationLink(destination: LoveLangView())
                         {
                             CategoryItem(image:"lovelanguage", text:"Retake Love Languages Quiz")
                         }
                     }
                     if UserDefaults.standard.string(forKey: "WA") == nil {
                         NavigationLink(destination: LoveLangView())
                         {
                             CategoryItem(image:"lovelanguage", text:"Complete Love Languages Quiz")
                         }
                     }
                        
                      
                     if UserDefaults.standard.string(forKey: "personalitytype") == nil {
                         NavigationLink(destination: PersonalityQuizView())
                         {
                             CategoryItem(image:"personalityimage", text:"Complete Personality Quiz")
                         }
                     
                     }
                     if UserDefaults.standard.string(forKey: "personalitytype") != nil {
                          NavigationLink(destination: PersonalityQuizView())
                         {
                             CategoryItem(image:"personalityimage", text:"Retake Personality Quiz     ")
                         }
                     }
                         
                 }
                 VStack(alignment: .leading, spacing: 10){
                     if UserDefaults.standard.string(forKey:"photo_url") == nil {
                       NavigationLink(destination: UpdateMediaView())
                        {
                             CategoryItem(image:"profileimage", text:"Add Profile Photo                       ")
                         }
                          
                     }
                  
                     if UserDefaults.standard.string(forKey:"photo_url") != nil {
                         NavigationLink(destination: UpdateMediaView())
                         {

                             CategoryItem(image:"profileimage", text:"Edit Profile Photo                     ")
                         }
                     }
                   }
                Button(action: {
                    print("Done")
                    if UserDefaults.standard.string(forKey:"photo_url") != nil && UserDefaults.standard.string(forKey: "gender") != nil
                    && UserDefaults.standard.string(forKey: "agePref") != nil
                    && UserDefaults.standard.string(forKey: "age") != nil
                    && UserDefaults.standard.string(forKey: "genderPref") != nil
                    && UserDefaults.standard.string(forKey: "personalitytype") != nil
                    && UserDefaults.standard.string(forKey: "WA") != nil
                    && UserDefaults.standard.string(forKey: "QT") != nil
                    && UserDefaults.standard.string(forKey: "RG") != nil
                    && UserDefaults.standard.string(forKey: "AS") != nil
                    && UserDefaults.standard.string(forKey: "PT") != nil
                    {
                        self.showingSignOn.toggle()
                    }
                    else {
                       self.showingAlert.toggle()
                    }
                    
                }) {
                Text("Submit")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(width: 350, height: 60, alignment: .center)
                    .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
                    .cornerRadius(10)
                }
                
            .alert(isPresented: $showingAlert) {
                     Alert(title: Text("Incomplete Profile"), message: Text("Finish your profile to best help us find you matches."), dismissButton: .default(Text("Got it!")))
            }

                NavigationLink(destination: SignInView(), isActive: $showingSignOn) {
                    EmptyView()
                }
            }
        }
            .navigationBarTitle("Create Your Profile",displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = UIColor(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
        
        .navigationBarBackButtonHidden(true)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

