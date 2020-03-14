//
//  PlaygroundView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 09/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct PlaygroundView: View {
    
    
    @State var roulettePosition: CGFloat = 30
    @State private var actualQuote: Int = 0
    
    @State var showGuideView:Bool = false
    
    var animationView = MuscleUpRouletteAnimation()
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    MuscleUpRouletteAnimation()
                        .scaleEffect(geometry.size.height / 520)
                        .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
                .padding(.top, 230)
                .background(
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                )
            }
            //MARK: - GUIDE BUTTON QUESTIONMARK
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        self.haptics.notificationOccurred(.success)
                        self.showGuideView.toggle()
                        
                    }) {
                        Image(systemName: "questionmark.circle")
                            .font(.custom("TitilliumWeb-Black", size: 45))
                            .foregroundColor(Color("ColorBlue1"))
                    }
                    .sheet(isPresented: self.$showGuideView) {
                        GuideView()
                    }
                    Spacer()
                }
            }
            .padding()
            .padding(.trailing, 15)
        }
    }
}

struct PlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundView()
    }
}
