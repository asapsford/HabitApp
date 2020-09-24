//
//  HabitActivity.swift
//  HabitApp
//
//  Created by Alex Sapsford on 24/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import Foundation

struct HabitActivity: Identifiable , Codable {
    let id = UUID()
    let name: String
    let description: String
    var completeTime: Int
}
