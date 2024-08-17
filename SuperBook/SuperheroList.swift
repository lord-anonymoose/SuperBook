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
        List {
            ForEach(heroes, id: \.id) { hero in
                if let urlString = hero.images?.xs {
                    Button(action: {
                        print("Hero with \(String(describing: hero.id)) ID tapped")
                    }) {
                        SuperheroCell(imageURL: URL(string: urlString), name: hero.name, id: hero.id)
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .onAppear(perform: {
            loadHeroes()
        })
    }
    
    private func loadHeroes() {
        NetworkService.getCharacters { heroes in
            DispatchQueue.main.async {
                self.heroes = heroes
            }
        }
    }
}

/*
#Preview {
}
*/
