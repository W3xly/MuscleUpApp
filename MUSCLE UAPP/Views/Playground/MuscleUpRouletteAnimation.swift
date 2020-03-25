//
//  MuscleUpAnimationView.swift
//  Muscle UApp
//
//  Created by Johana Šlechtová on 03/02/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

//MARK: - IMAGE ARRAY

enum MuscleUpImage: Int, CaseIterable { // Inherituje z INT
    
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
        self.animating = Double(position.rawValue) // enum -> Double
    }
    
    private var animating: Double // Double podporuje Animatable
    var animatableData: Double { // potřebná část Animatable protokolu
        get { animating }
        set { animating = newValue }
    }
    
    func body(content: Content) -> some View {
        return MuscleUpImage(rawValue: Int(animating))!.image // Double -> enum
    }
}
//MARK: - MAIN VIEW
struct MuscleUpRouletteAnimation: View {
    
    var exercise: [Exercise] = exerciseData
    
    @State private var movement: MuscleUpImage = .muscleUp1
    @State private var rotateOuter = false // Rotuje Ruletou / Textem
    @State private var roulettePosition : Bool = false
    @State private var showDetail: Bool = false
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
                        .foregroundColor(Color.white)
                    
                    RouletteView(exercise: exerciseData[actualExercise])
                        .rotationEffect(.degrees(rotateOuter ? 360*3 : 0)) // Rotuje textem
                        .animation(Animation.easeInOut.speed(1.5))
                }
                .onTapGesture() {
                    self.rotateOuter.toggle() // Rotuje ruletou
                    self.actualExercise = Int.random(in: 0...exerciseData.count - 1)
                    // Generuje náhodný cvik - opakování jsou generovány v Roulette View
                }
                .onLongPressGesture {
                    self.showDetail = true

                }.sheet(isPresented: self.$showDetail) {
                    ExerciseDetailView(exercise: exerciseData[self.actualExercise])
                }
                //MARK: - RULETA
                ZStack {
                    Circle()  //
                        .trim(from: 1/2, to: 4/5) // Délka boční linie (bl)
                        .stroke(style: .init(lineWidth: 10, lineCap: .square, lineJoin: .round)) // Šířka a tvar bl
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color("ColorBlue1"))
                    Circle()  //
                        .trim(from: 1/2, to: 4/5)
                        .stroke(style: .init(lineWidth: 10, lineCap: .square, lineJoin: .round))
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color("ColorBlue1"))
                        .rotationEffect(.degrees(180)) // Staví druhou linii do opozice
                    
                }
                    .rotationEffect(.degrees(rotateOuter ? 400*3 : 60)) // Rotace linií
                    .animation(Animation.spring(response: 0.8)) // Doznění animace liníí
                
            }
                .offset(y: roulettePosition ? -150 : 250) // Pozice Rulety
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
