//
//  MuscleUpAnimationView.swift
//  Muscle UApp
//
//  Created by Johana Šlechtová on 03/02/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

//MARK: - IMAGE ARRAY

enum MuscleUpImage: Int, CaseIterable { // Inherited from Int for convenient below
    
    case muscleUp1, muscleUp2, muscleUp3, muscleUp4, muscleUp5
    
    var image: some View {
        var move: Image
        switch self {
            case .muscleUp1: move = Image("MuscleUp1")
            case .muscleUp2: move = Image("MuscleUp2")
            case .muscleUp3: move = Image("MuscleUp3")
            case .muscleUp4: move = Image("MuscleUp4")
            case .muscleUp5: move = Image("MuscleUp5")
        }
        return move
    }
}

//MARK: - IMAGE ANIMATION

struct MuscleUpModifier: AnimatableModifier {
    var position: MuscleUpImage
    
    init(image: MuscleUpImage) {
        self.position = image
        self.animating = Double(position.rawValue) // enum to Double
    }
    
    private var animating: Double // Double supports Animatable
    var animatableData: Double { // required part of Animatable protocol
        get { animating }
        set { animating = newValue }
    }
    
    func body(content: Content) -> some View {
        return MuscleUpImage(rawValue: Int(animating))!.image // Double -> enum
    }
}
//MARK: - VIEW
struct MuscleUpRouletteAnimation: View {
    @State private var movement: MuscleUpImage = .muscleUp1
    @State private var rotateOuter = false
    @State private var roulettePosition : Bool = false
    
     @State private var actualExercise: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Color.clear // << jenom holder - musí být
                .modifier(MuscleUpModifier(image: movement))
                .onTapGesture {
                    withAnimation { // animates between enum states
                        self.movement =
                            (self.movement == .muscleUp1 ? .muscleUp5 : .muscleUp1)
                        self.roulettePosition.toggle()
                    }
            } // Konec Muscle Up Animace
            ZStack {
                ZStack { // Je potřeba aby se dalo klikat skrz text
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                    
                    RouletteView(exercise: exerciseData[actualExercise])
                    .rotationEffect(.degrees(rotateOuter ? 360*3 : 0))
                    .animation(Animation.easeInOut)
                }
                .onTapGesture() {
                    self.rotateOuter.toggle()
                    self.actualExercise = Int.random(in: 0...exerciseData.count - 1)
                }
                
                ZStack {
                    Circle()  //
                        .trim(from: 1/2, to: 4/5)
                        .stroke(style: .init(lineWidth: 10, lineCap: .square, lineJoin: .round))
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color("ColorBlue1"))
                    Circle()  //
                        .trim(from: 1/2, to: 4/5)
                        .stroke(style: .init(lineWidth: 10, lineCap: .square, lineJoin: .round))
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color("ColorBlue1"))
                        .rotationEffect(.degrees(180))
                    
                }
                .rotationEffect(.degrees(rotateOuter ? 400*3 : 60))
                .animation(Animation.spring(response: 0.95))
                
            }
            .offset(y: roulettePosition ? -150 : 250) // Pozice rulety
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
//MARK: - PREVIEW
struct MuscleUpRouletteAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MuscleUpRouletteAnimation()
            .previewDevice("Iphone 8")
    }
}
