//
//  ProfileFormView.swift
//  CoffeeAnyone
//
//  Created by Carrie Davis on 2/29/20.
//  Copyright © 2020 Dating App. All rights reserved.
//

import SwiftUI
import Combine

struct ProfileFormView: View {
    @ObservedObject var selected = Profile()
    var body: some View {
        Form {
                VStack {
                    Text("Add Your Personal Statement:")
                    .font(.headline)
                    TextField("Type your statement here", text: $selected.statement)
                    .padding()
                }
                Section(header: Text("Basics").bold()) {
                    
                Picker(selection: $selected.selectedStatus, label: Text("Relationship Status")) {
                    ForEach(Status.allCases, id: \.self) { stats in
                        Text("\(stats.rawValue)").tag(stats)
                    }
                }
            
                Picker(selection: $selected.selectedGender, label: Text("Gender")) {
                    ForEach(Gender.allCases, id: \.self) { gender in
                        Text("\(gender.rawValue)").tag(gender)
                    }
                }
                Picker(selection: $selected.selectedAge, label: Text("Age")) {
                    ForEach(Age.allCases, id: \.self) { age in
                        Text("\(age.rawValue)").tag(age)
                    }
                }
                Picker(selection: $selected.selectedType, label: Text("Body Type")) {
                    ForEach(BodyType.allCases, id: \.self) { type in
                        Text("\(type.rawValue)").tag(type)
                    }
                }
                Picker(selection: $selected.selectedEdu, label: Text("Education")) {
                    ForEach(Education.allCases, id: \.self) { edu in
                        Text("\(edu.rawValue)").tag(edu)
                    }
                }
                Picker(selection: $selected.selectedJobs, label: Text("Occupation")) {
                    ForEach(Jobs.allCases, id: \.self) { job in
                        Text("\(job.rawValue)").tag(job)
                    }
                }
            HStack {
                Text("Height")
                    .font(.body)
                TextField("Type your height Here", text: $selected.height)
                    .padding()
                }
                    Toggle("Has Kids?", isOn: $selected.haskids)
            }
            Section(header: Text("Location").bold()) {
                HStack {
                    Text("Area")
                    .font(.body)
                    TextField("Type your city/county Here", text: $selected.city)
                    .padding()
                    Text("State")
                    .font(.body)
                    TextField("Type your state Here", text: $selected.state)
                    .padding()
                }
            }

        }
    }
}

struct ProfileFormView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFormView()
    }
}
