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
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("preferredTheme") private var preferredTheme = 0

    @State var showHeaders: Bool = true
    
    var body: some View {
        TabView(selection: $tabSelected) {
            SuperheroList(heroes: heroes, showHeaders: $showHeaders)
                .tabItem {
                    Label("Superheroes", systemImage: "list.star")
                }
                .tag(1)
            
            SettingsView(showHeaders: $showHeaders)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
        }
        .preferredColorScheme(ColorThemeService.themeFromTag(preferredTheme))
    }
}

/*
#Preview {
    ContentView(showHeaders: <#Bool#>)
}
*/
