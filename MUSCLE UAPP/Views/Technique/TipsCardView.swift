//
//  TipsCardView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 10/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct TipsCardView: View {
    
    var tips: Tips
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(tips.content)
                .font(Font.custom("TitilliumWeb-Black", size: 30))
                .foregroundColor(Color("ColorBlue4"))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .padding()
            Image(tips.image)
                .resizable()
                .scaledToFit()
        }
        .background (
            RoundedRectangle(cornerRadius: 5)
                .fill(Color("ColorBlue2"))
                .shadow(color: Color("ColorBlue3"), radius: 6, x: 0, y: 6)
        )
            .border(Color("ColorBlue4"), width: 5)
            .cornerRadius(5)
    }
}

struct TipsCardView_Previews: PreviewProvider {
    static var previews: some View {
        TipsCardView(tips: tipsData[0])
            .previewLayout(.sizeThatFits)
    }
}
