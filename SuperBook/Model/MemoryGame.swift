//
//  memoryGame.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 30.08.2024.
//

import Foundation


protocol Game {
    func start()
    func finish()
}


class MemoryGame: Game {
    
    var cards: [Superhero]
    
    
    init(superheroes: [Superhero]) {
        self.cards = (superheroes.shuffled() + superheroes.shuffled()).shuffled()
    }
    
    func start() {
        
    }
    
    func finish() {
        
    }
}
