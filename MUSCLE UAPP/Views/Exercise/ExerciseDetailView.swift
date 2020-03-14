//
//  ExerciseDetailView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 12/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI // Kvůli Gif Animaci

struct ExerciseDetailView: View {
    
    var exercise: Exercise
    
    @State private var pulsate: Bool = false // Pulsování dismiss buttonu
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12) {
                AnimatedImage(name: exercise.gif)
                    .onFailure { error in
                        print("Problem with loading gif image.")
                }
                    .placeholder(UIImage(systemName: "photo")) // Placeholder
                    .indicator(SDWebImageActivityIndicator.medium) // Indikátor Aktivity
                    .scaledToFill()
                
                //MARK: - TITLE
                
                VStack(spacing: 12) {
                    Text(exercise.title)
                        .font(.custom("TitilliumWeb-Black", size: 40))
                        .foregroundColor(Color("ColorBlue1"))
                        .minimumScaleFactor(0.5)
                        .lineLimit(2)
                        .padding()
                        .background (
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("ColorBlue4"))
                                .frame(minWidth: 250)
                                .shadow(color: Color("ColorBlue2"), radius: 6, x: 0, y: 6)
                    )
                    
                    //MARK: - TEXT
                    
                    ForEach(exercise.stepByStep, id: \.self) { item in
                        VStack(alignment: .center, spacing: 0) {
                            
                            Capsule() // Odděluje jednotlivé texty
                                .frame(width:120, height: 6)
                                .foregroundColor(Color("ColorBlue3"))
                                .opacity(0.5)
                            
                            Text(item)
                                .lineLimit(nil)
                                .foregroundColor(Color("ColorBlue3"))
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 80)
                        }
                    }
                    
                }
                .padding(.horizontal, 15)
            }
                
                //MARK: - DIMISS BUTTON
                
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "chevron.down.circle.fill")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .shadow(radius: 4)
                                    .opacity(self.pulsate ? 1 : 0.6)
                                    .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
                                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                            })       
                                .padding(.trailing, 20)
                                .padding(.top, 24)
                            Spacer()
                        }
                    }
            )
                .onAppear() {
                    self.pulsate.toggle()
            }
                .padding(.top, -20) // Odstraňuje bílou lajnu nad gifem
        }
    }
}
struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exercise: exerciseData[3])
    }
}
