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
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(heroes, id: \.id) { hero in
                        SuperHeroCell(imageURL: URL(string: hero.images.xs)!, name: hero.name, id: "\(hero.id)")
                            //.padding(.horizontal)
                    }
                }
            }
        }
        .onAppear(perform: {
            loadHeroes()
        })
        .padding()
    }
    
    private func loadHeroes() {
        NetworkService.getCharacters { heroes in
            DispatchQueue.main.async {
                self.heroes = heroes
            }
        }
    }
}


#Preview {
    ContentView()
}
