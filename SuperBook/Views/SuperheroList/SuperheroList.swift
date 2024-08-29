//
//  SuperHeroList.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 18.08.2024.
//

import SwiftUI

struct SuperheroList: View {
    @State var heroes: [Superhero]
    
    @AppStorage("showHeaders") private var showHeaders: Bool = false

    var body: some View {
        NavigationStack {
            List(heroes, id: \.id) { hero in
                NavigationLink {
                    SuperheroInfoView(superhero: hero)
                } label: {
                    SuperheroCell(imageURL: hero.images?.sm, name: hero.name, id: hero.id)
                        .contentShape(Rectangle())
                }
            }
            .navigationTitle(showHeaders ? "Superheroes" : "")
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
