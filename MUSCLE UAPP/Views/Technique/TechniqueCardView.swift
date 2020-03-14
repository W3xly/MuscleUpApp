//
//  TechniqueCardView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 09/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct TechniqueCardView: View {
    
    var technique: Technique
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    @State private var showDetail: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(technique.title.uppercased())
                .font(.custom("TitilliumWeb-Black", size: 28))
                .minimumScaleFactor(0.3)
                .foregroundColor(.white)
                .padding()
                .lineLimit(1)
            Spacer()
            Image(technique.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 246, height: 190)
        }
        .background(Color("ColorBlue4"))
        .cornerRadius(30)
        .frame(width: 246, height: 330)
        .shadow(color: Color("ColorBlueShadow"), radius: 5, x: 5, y: 0)
        .onTapGesture {
            self.hapticImpact.impactOccurred()
            self.showDetail = true
        }
        .sheet(isPresented: self.$showDetail) {
            TechniqueDetailView(technique: self.technique)
        }
    }
}

struct TechniqueCardView_Previews: PreviewProvider {
    static var previews: some View {
        TechniqueCardView(technique: techniqueData[0])
            .previewLayout(.sizeThatFits)
    }
}
