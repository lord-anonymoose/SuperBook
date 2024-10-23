//
//  memoryGame.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 30.08.2024.
//

import Foundation
import SwiftUI


protocol Game {
    func start()
    func finish()
}

struct CardInfo {
    let uiimage: UIImage
    let name: String
}

class MemoryGame: Game, ObservableObject {
    
    // An array of MemoryCardView storing all created cards
    @Published var cards: [MemoryCardView] = []
    
    // An array of cards states (which one is open and which one is closed)
    @Published var cardsAreOpen: [Bool] = []
    
    // An array of card infos. Used before shuffling self.cards and self.cardsAreOpen
    private var cardInfos: [CardInfo] = []
        
    init() { 
        loadImages()
    }
    
    func start() { 
        self.cards = []
        self.cardsAreOpen = []
        self.cardInfos = []
        loadImages()
    }
    
    func finish() { 
    }

    
    func loadImages() {

        NetworkService.getCharacters { heroes in
            var superheroes = heroes.shuffled()
            superheroes.removeAll(where: { $0.images?.md == nil })
            
            if superheroes.count > 9 {
                superheroes = Array(superheroes.prefix(9))
            }
            
            let group = DispatchGroup()
            
            for superhero in superheroes {
                guard let url = URL(string: superhero.images?.md ?? "") else {
                    print("Invalid url from API!")
                    continue
                }
                
                group.enter()
                
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else {
                        print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
                        group.leave()
                        return
                    }
                    
                    if let uiImage = UIImage(data: data) {
                        let info = CardInfo(uiimage: uiImage, name: superhero.name ?? "Unknown")
                        DispatchQueue.main.async {
                            self.cardInfos.append(info)
                            self.cardInfos.append(info)
                            self.cardsAreOpen.append(false)
                            self.cardsAreOpen.append(false)
                        }
                    } else {
                        print("Failed to convert data to image")
                    }
                    
                    group.leave()
                }.resume()
            }
            
            group.notify(queue: .main) {
                
                var currentIndex = 0
                self.cardInfos = self.cardInfos.shuffled()
                
                for i in 0 ... self.cardInfos.count - 1 {
                    let image = Image(uiImage: self.cardInfos[i].uiimage)
                    let name = self.cardInfos[i].name
                    let cardView = MemoryCardView(
                        isOpen: Binding(
                            get: { self.cardsAreOpen[i] },
                            set: { self.cardsAreOpen[i] = $0 }
                        ),
                        image: image,
                        name: name
                    )
                    
                    // Update cards on the main thread
                    DispatchQueue.main.async {
                        self.cards.append(cardView)
                    }
                    
                    currentIndex += 1
                }
            }
        }
    }
}
