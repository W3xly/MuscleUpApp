//
//  NavigationView.swift
//  MUSCLE UAPP
//
//  Created by Johana Šlechtová on 09/03/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

struct NavigationView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "ColorBlue4")
    }
    var body: some View {
        TabView {
            PlaygroundView()
                .tabItem({
                    Image("playground")
                    Text("HŘIŠTĚ")
                })
            ExerciseView()
                .tabItem({
                    Image("muscle") 
                    Text("CVIKY")
                })
            TechniqueView()
                .tabItem({
                    Image("technique")
                    Text("TECHNIKA")
                })
            InfoView()
                .tabItem({
                    Image("info")
                    Text("INFO")
                })
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color.primary)
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}

