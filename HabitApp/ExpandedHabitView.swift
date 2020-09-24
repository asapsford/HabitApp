//
//  ExpandedHabitView.swift
//  HabitApp
//
//  Created by Alex Sapsford on 24/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI

struct ExpandedHabitView: View {
    
    @ObservedObject var habitActivities: HabitActivities
    @State var habitActivity: HabitActivity
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Habit name")) {
                    Text(habitActivity.name)
                }
                
                Section(header: Text("Habit description")) {
                    Text(habitActivity.description)
                }
                
                Section(header: Text("Times Completed")) {
                    HStack{
                        Text("\(habitActivity.completeTime)")
                        Spacer()
                        Button(action: {
                            // action
                            self.habitActivity.completeTime += 1
                            
                            if let firstIndex = self.habitActivities.habits.firstIndex(where: { (habitActivity) -> Bool in
                                habitActivity.id == self.habitActivity.id
                            }) {
                                self.habitActivities.habits[firstIndex] = self.habitActivity
                            }
                        }) {
                            Image(systemName: "plus").font(.system(size: 16, weight: .medium)).foregroundColor(.blue)
                        }
                    }.padding(.trailing)
                }
            } .navigationBarTitle("Habit Detail", displayMode: .inline)
        }
    }
}

struct ExpandedHabitView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedHabitView(habitActivities: HabitActivities(), habitActivity: HabitActivity(name: "Running", description: "5km run", completeTime: 20 ))
    }
}
