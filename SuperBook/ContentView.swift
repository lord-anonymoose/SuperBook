//
//  ContentView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 16.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var heroes: [Superhero] = []
    
    @AppStorage("tab") private var tabSelected = 1
    @AppStorage("preferredTheme") private var preferredTheme = 0
    @AppStorage("showHeaders") private var showHeaders: Bool = false
    @AppStorage("cellHeight") private var cellHeight = 150.0
    
    var body: some View {
        TabView(selection: $tabSelected) {
            SuperheroList(heroes: heroes)
                .tabItem {
                    Label("Superheroes", systemImage: "list.star")
                }
                .tag(1)
            
            GameView()
                .tabItem {
                    Label("Games", systemImage: "dice.fill")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(3)
        }
        .preferredColorScheme(ColorThemeService.themeFromTag(preferredTheme))
    }
}

/*
#Preview {
    ContentView(showHeaders: <#Bool#>)
}
*/
