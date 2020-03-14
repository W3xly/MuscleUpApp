//
//  InfoView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 09/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Capsule()
                .frame(width:120, height: 6)
                .foregroundColor(Color("ColorBlue3"))
                .opacity(0.6)
                .padding(.top, 20)
            Image("logo_text_white")
                .resizable()
                .scaledToFit()
            Text("App Info")
                .font(.custom("TitilliumWeb-Black", size: 30))
                .foregroundColor(Color("ColorBlue3"))
            AppInfoView()
                .padding()
                .padding(.top, 10)
            Text("V případě zájmu o spolupráci mne můžete kontaktovat na e-mailu.")
                .padding()
                .multilineTextAlignment(.center)
                .foregroundColor(Color("ColorBlue4"))
            Capsule()
                .frame(width:120, height: 6)
                .foregroundColor(Color("ColorBlue3"))
                .opacity(0.6)
            Text("jan.podmolik@gmail.com")
                .font(.headline)
                .padding()
            Spacer()
        }
            
        .background(Color("ColorBlue2"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(itemOne: "Aplikace", itemTwo: "Muscle UAPP")
            RowAppInfoView(itemOne: "Kompatabilita", itemTwo: "iPhone iOS 13")
            RowAppInfoView(itemOne: "Vývoj", itemTwo: "Jan Podmolík")
            RowAppInfoView(itemOne: "Design", itemTwo: "Jan Podmolík")
            RowAppInfoView(itemOne: "Foto/Video", itemTwo: "Josefína Šlechtová Jan Podmolík")
            RowAppInfoView(itemOne: "Verze", itemTwo: "1.0.0")
        }
    }
}

struct RowAppInfoView: View {
    //MARK: - PROPERTIES
    
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        VStack {
            HStack {
                Text(itemOne)
                    .foregroundColor(Color("ColorBlue3"))
                Spacer()
                Text(itemTwo)
                    .foregroundColor(Color("ColorBlue4"))
                    .frame(maxWidth: 160)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.trailing)
            }
            Divider()
        }
    }
}
