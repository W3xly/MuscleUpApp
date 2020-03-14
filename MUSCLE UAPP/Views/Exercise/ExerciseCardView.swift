//
//  ExerciseCardView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 11/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct ExerciseCardView: View {
    
    var exercise: Exercise
    
    @State private var showDetail: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        VStack(spacing: 0) {
            Image(exercise.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "video")
                                .font(Font.title.weight(.bold))
                                .foregroundColor(Color("ColorBlue1"))
                                .shadow(color: Color("ColorBlue4"), radius: 2, x: 0, y: 0)
                                .padding()
                            Spacer()
                        }
                    }
            ) // symbol kamery
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(exercise.title)
                        .font(.custom("TitilliumWeb-Black", size: 30))
                        .foregroundColor(Color("ColorBlue1"))
                        .lineLimit(2)
                    Spacer()
                    ForEach(self.exercise.parts, id: \.self) { item in
                        Image("\(item)")
                    }
                .lineLimit(2)
                }
                .padding(.horizontal, 10)
                .border((Color("ColorBlue2")), width: 3)
            }
        }
        .background(Color("ColorBlue4"))
        .onTapGesture {
            self.hapticImpact.impactOccurred()
            self.showDetail = true
        }
        .sheet(isPresented: self.$showDetail) {
            ExerciseDetailView(exercise: self.exercise)
        }
    }
}

struct ExerciseCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCardView(exercise: exerciseData[0])
            .previewLayout(.sizeThatFits)
    }
}
