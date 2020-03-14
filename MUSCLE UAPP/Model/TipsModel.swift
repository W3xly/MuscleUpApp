//
//  FactModel.swift
//  Avocados
//
//  Created by Johana Šlechtová on 27/01/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

//MARK: - TipsModel

struct Tips: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
