//
//  ContentView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 16.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var heroes: [Superhero] = []
    
    var body: some View {
        SuperheroList(heroes: self.heroes)
    }
}


#Preview {
    ContentView()
}
