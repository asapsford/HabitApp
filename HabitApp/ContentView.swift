//
//  ContentView.swift
//  HabitApp
//
//  Created by Alex Sapsford on 24/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI

// list of all activities they want to track
// form to add new activities

// tapping one of the activities shows a screen with the description, how many times they have completed it and a plus button incrementing their completion count

// use codable and userdefaults to load and save all your data 

struct ContentView: View {
    
    @ObservedObject var habitActivities = HabitActivities()
    @State private var showAddView = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(habitActivities.habits) { habit in
                    NavigationLink(destination: ExpandedHabitView(habitActivities: self.habitActivities, habitActivity: habit)) {
                    HStack{
                        VStack(alignment: .leading) {
                            Text(habit.name).font(.headline)
                            Text(habit.description).font(.subheadline)
                        }
                        Spacer()
                        Text("Times Completed: \(habit.completeTime)")
                    }
                }
            } .onDelete(perform: removeHabits)

            }
            .navigationBarTitle("Habit")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showAddView = true
            }) {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showAddView){
                    AddHabitView(habitActivities: self.habitActivities)
            }
        }
        }
    
    func removeHabits(at offsets: IndexSet){
        habitActivities.habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
