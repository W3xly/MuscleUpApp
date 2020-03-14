//
//  TechniqueView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 09/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct TechniqueView: View {
    
    var technique: [Technique] = techniqueData
    var tips: [Tips] = tipsData
    
    @State private var actualTip: Int = 0
    @State private var showDetail: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            InfoTextView(infoName: "Technika")
                .padding(.top, 35)
                .padding(.bottom, -20)
            
            //MARK: - TECHNIKY
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30.0) {
                    ForEach(self.technique, id: \.self) { item in
                        GeometryReader { geometry in
                            TechniqueCardView(technique: item)
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minX - 80) / -20), axis: (x: 0, y: 10.0, z: 0))
                            // Rotuje Kartou lehce v Y ose
                        }
                        .frame(width: 246, height: 330)
                        .onTapGesture {
                            self.hapticImpact.impactOccurred() // Klik odezva
                            self.showDetail = true // Technique Detail View
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .padding(.leading, 70)
                .padding(.trailing, 55)
            } // KONEC TECH SCROLL VIEW
            
            InfoTextView(infoName: "Tipy")
                .padding(.bottom, -20)
            
            //MARK: - TIPY
            
            TipsCardView(tips: tipsData[actualTip])
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .padding(.bottom, 100)
                .animation(Animation.easeOut(duration: 0.05))
                .onTapGesture { // Rotuje mezi tipy
                    if self.actualTip < tipsData.count - 1 {
                        self.actualTip += 1
                    } else {
                        self.actualTip = 0
                    }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .background(Color("ColorBlue2"))
        .edgesIgnoringSafeArea(.all)
    }
}
struct TechniqueView_Previews: PreviewProvider {
    static var previews: some View {
        TechniqueView()
    }
}

//MARK: - TITLE MODIFIER

struct InfoTextView: View {
    
    let name: String
    
    init(infoName: String) {
        self.name = infoName
    }
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.down.square.fill")
                .font(.system(size: 40))
                .foregroundColor(Color("ColorBlue4"))
            Text(name)
                .font(Font.custom("TitilliumWeb-Black", size: 38))
                .foregroundColor(Color("ColorBlue4"))
            Image(systemName: "arrow.down.square.fill")
                .font(.system(size: 40))
                .foregroundColor(Color("ColorBlue4"))
        }
        .padding(.leading, 35)
        .padding(.trailing, 35)
        .background (
            RoundedRectangle(cornerRadius: 5)
                .fill(Color("ColorBlue1"))
        )
            .background(Color("ColorBlue1"))
            .border(Color("ColorBlue4"), width: 5)
            .cornerRadius(5)
    }
}
