//
//  ExerciseModel.swift
//  Muscle UApp
//
//  Created by Johana Šlechtová on 05/02/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct Exercise: Identifiable {
    var id = UUID()
    var title: String
    var stepByStep: [String]
    var image: String
    var gif: String
    var parts: [String]
    var reps: [Int]
}
