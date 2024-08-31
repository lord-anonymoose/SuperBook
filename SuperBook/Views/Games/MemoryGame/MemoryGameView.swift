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
    @State private var prevCard: Int? = nil
    @State private var isInteractionDisabled = false
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
                        MemoryCardView(isOpen: $memoryGame.cardsAreOpen[i], image: memoryGame.cards[i].image, name: memoryGame.cards[i].name)
                            .onTapGesture {
                                if isInteractionDisabled {
                                    return
                                }
                                
                                let numberOfTrue = self.memoryGame.cardsAreOpen.filter{$0}.count
                                flipCard(at: i)
                                
                                if prevCard == nil {
                                    prevCard = i
                                } else if prevCard != nil {
                                    if memoryGame.cards[i].name == memoryGame.cards[prevCard!].name {
                                        print("It's a pair!")
                                        prevCard = nil
                                    } else {
                                        isInteractionDisabled = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            flipCard(at: i)
                                            flipCard(at: prevCard!)
                                            prevCard = nil
                                            isInteractionDisabled = false
                                        }
                                    }
                                }

                            }
                    }
                }
            }
        }
        .onAppear{
            print("View appeared")
        }
    }
}

#Preview {
    MemoryGameView()
}
