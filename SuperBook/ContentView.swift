//
//  ContentView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 16.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("tab") private var tabSelected = 1
    @State private var heroes: [Superhero] = []
    
    var body: some View {
        TabView(selection: $tabSelected) {
            SuperheroList(heroes: heroes)
                .tabItem {
                    Label("Superheroes", systemImage: "list.star")
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
        }
    }
}


#Preview {
    ContentView()
}
