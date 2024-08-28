//
//  SuperHeroList.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 18.08.2024.
//

import SwiftUI

struct SuperheroList: View {
    @State var heroes: [Superhero]
    
    var body: some View {
        NavigationStack {
            List(heroes, id: \.id) { hero in
                NavigationLink {
                    Text("Hello, world!")
                } label: {
                    SuperheroCell(imageURL: hero.images?.xs, name: hero.name, id: hero.id)
                        .contentShape(Rectangle())
                }
            }
        }
        .task {
            await loadHeroes()
        }
    }
    
    private func loadHeroes() async {
        NetworkService.getCharacters { heroes in
            self.heroes = heroes
        }
    }
}

/*
#Preview {
}
*/
