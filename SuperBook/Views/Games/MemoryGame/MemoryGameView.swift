//
//  MemoryGameView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 30.08.2024.
//

import SwiftUI

struct MemoryGameView: View {
    @State private var orientation = UIDevice.current.orientation
    @StateObject private var memoryGame = MemoryGame()
    
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
    ]
    
    func flipCard(at index: Int) {
        if index < memoryGame.cards.count {
            memoryGame.cards[index].turn()
        }
    }

    private var imageSize = {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 200.0
        } else {
            return 100.0
        }
    }()
    
    
    var body: some View {
        ZStack {
            if self.memoryGame.cards.count < 18 {
                ProgressView("Loading cards...")
            } else {
                LazyVGrid(columns: columns) {
                    ForEach(0..<18) { i in
                        //self.memoryGame.cards[i]
                        MemoryCardView(isOpen: $memoryGame.cardsAreOpen[i], image: memoryGame.cards[i].image, name: memoryGame.cards[i].name)
                            .onTapGesture {
                                let numberOfTrue = self.memoryGame.cardsAreOpen.filter{$0}.count
                                if numberOfTrue < 2 {
                                    flipCard(at: i)
                                } else {
                                    
                                }
                            }
                        /*
                        self.memoryGame.cards[i].image
                            .resizable()
                            .scaledToFit()
                            .frame(height: imageSize)
                         */
                    }
                }
            }
        }
        .onAppear{
            print("View appeared")
            //self.memoryGame.loadImages()
        }
    }
}

#Preview {
    MemoryGameView()
}
