//
//  TechniqueModel.swift
//  Muscle UApp
//
//  Created by Johana Šlechtová on 10/02/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct Technique: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var technique: [String]
    var image: String
    var gif: String
}
