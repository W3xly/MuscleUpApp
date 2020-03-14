//
//  GuideView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 13/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI
//MARK: - GUIDE VIEW
struct GuideView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Image("logo_text_black")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, -15)
                
                Text("Zvládneš ho i TY!")
                    .font(.custom("TitilliumWeb-Black", size: 25))
                    .foregroundColor(Color("ColorBlue4"))
                
                Text("Vítám tě na tvojí cestě při zdolání Muscle Upu. Ať už bude tvá cesta jakkoli těžká, každý její krok je velmi cenný a pocit vítězství na konci bude stát za každou minutu tvého úsilí.")
                    .font(.custom("TitilliumWeb-Black", size: 14))
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                GuideComponent(
                    title: "Zdraví",
                    desctiption: "Zvládnutí Muscle Upu je jen špička ledovce. Sílu a kondici nabytou tréninkem jistě využiješ i jinde.",
                    icon: "heart.circle")
                GuideComponent(
                    title: "Čas",
                    desctiption: "Netrap se, pokud si dává tvůj první Muscle Up načas. Trénuj radši kratší dobu a častěji. Cíl je dost možná blíž, než myslíš!",
                    icon: "clock")
                GuideComponent(
                    title: "Ruleta cviků",
                    desctiption: "Využívej Ruletu na tréninku dle tvých potřeb. Nezlob se na sebe, pokud nezvládneš každé jedno opakování.",
                    icon: "arrow.2.circlepath.circle")
            }
            .padding(.horizontal, 25)
        }
    }
}


struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}

//MARK: - KOMPONENT

struct GuideComponent: View {
    
    //MARK: - PROPERTIES
    
    var title: String
    var desctiption: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(Color("ColorBlue4"))
            
            VStack(alignment: .leading, spacing: 4){
                HStack {
                    Text(title.uppercased())
                        .font(.custom("TitilliumWeb-Black", size: 30))
                        .foregroundColor(Color.black)
                }
                Divider().padding(.bottom, 4)
                Text(desctiption)
                    .font(.custom("TitilliumWeb-Black", size: 14))
                    .foregroundColor(Color("ColorBlue3"))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}
