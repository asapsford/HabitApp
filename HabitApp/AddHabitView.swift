//
//  AddHabitView.swift
//  HabitApp
//
//  Created by Alex Sapsford on 24/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI

struct AddHabitView: View {
    
     // view dismisses on its own
    @Environment (\.presentationMode) var presentationMode
    
    @ObservedObject var habitActivities: HabitActivities
    
    @State private var activityName = ""
    @State private var activityDescription = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Activity Name: ", text: $activityName )
                    
                    TextField("Description: ", text: $activityDescription)
                }
            }
            .navigationBarTitle("Add Habit", displayMode: .inline)
                
            .navigationBarItems(trailing: Button("Save", action: save))
            
        }.alert(isPresented: $showAlert) {
            
            Alert(title: Text("Error"), message: Text("Please enter a name for the habit."), dismissButton: .default(Text("Ok")))
        }
    }
    
    func save() {
        if activityName == "" {
            self.showAlert = true
            return
        }
        
        habitActivities.habits.append(HabitActivity(name: activityName, description: activityDescription, completeTime: 0))
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habitActivities: HabitActivities())
    }
}
