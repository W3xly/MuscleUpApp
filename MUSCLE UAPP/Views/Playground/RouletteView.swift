//
//  RouletteView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 12/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct RouletteView: View {
    
    var exercise: Exercise
    
    var body: some View {
        VStack {
            Text(exercise.title)
            
            .lineLimit(2)
            Text("\(String(exercise.reps[Int.random(in: 0...exercise.reps.count - 1)])) opakování")
        }
        .frame(width: 140, height: 150)
        .font(.custom("TitilliumWeb-Black", size: 15))
        .multilineTextAlignment(.center)
        .foregroundColor(Color("ColorBlue4"))
    }
}

struct RouletteView_Previews: PreviewProvider {
    static var previews: some View {
        RouletteView(exercise: exerciseData[0])
            .previewLayout(.sizeThatFits)
    }
}
