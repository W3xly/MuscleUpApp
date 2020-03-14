//
//  ExerciseView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 09/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct ExerciseView: View {
    
    var exercise: [Exercise] = exerciseData
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    InfoTextView(infoName: "Cviky")
                        .padding(.top, 35) // Kvulí notchi
                    ForEach(exercise) { item in
                        ExerciseCardView(exercise: item)
                            .border((Color("ColorBlue4")), width: 5)
                            .cornerRadius(5)
                            .padding(.horizontal, 3)
                        
                    }
                }
                .frame(minWidth: 350)
                .shadow(color: Color("ColorBlue4"), radius: 2, x: 2, y: 1)
            }
                .padding(.bottom, 60) // Kvůli Navigation Baru
        }
        .background(Color("ColorBlue2"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
