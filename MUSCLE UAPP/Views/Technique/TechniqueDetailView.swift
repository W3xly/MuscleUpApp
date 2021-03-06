//
//  TechniqueDetailView.swift
//  Muscle UApp
//
//  Created by Johana Šlechtová on 11/02/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI // Potřebný pro zobrazení gifů

struct TechniqueDetailView: View {
    
    var technique: Technique
    
    @Environment(\.presentationMode) var presentationMode
    @State private var pulsate: Bool = false // Pulsování dismiss buttonu
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                AnimatedImage(name: technique.gif)
                    .onFailure { error in
                        print("Problem with loading gif image.")
                }
                    .placeholder(UIImage(systemName: "photo")) // Placeholder
                    .indicator(SDWebImageActivityIndicator.medium) // Indikátor Aktivity
                    .scaledToFill()
                
                //MARK: - TITLE
                
                VStack(spacing: 10) {
                    Text(technique.title)
                        .font(.custom("TitilliumWeb-Black", size: 40))
                        .foregroundColor(Color("ColorBlue4"))
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                    
                    //MARK: - TECHNIKA
                    
                    ForEach(technique.technique, id: \.self) { item in
                        VStack(alignment: .center, spacing: 5) {
                            
                            Capsule()
                                .frame(width:120, height: 6)
                                .foregroundColor(Color("ColorBlue3"))
                                .opacity(0.5)
                            
                            Text(item)
                                .lineLimit(nil)
                                .foregroundColor(Color("ColorBlue3"))
                                .multilineTextAlignment(.center)
                                .font(.custom("TitilliumWeb-SemiBold", size: 16))
                                .frame(minHeight: 80)
                        }
                    }
                    
                }
                .padding(.horizontal, 20)
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
                                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
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


struct TechniqueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TechniqueDetailView(technique: techniqueData[0])
    }
}
