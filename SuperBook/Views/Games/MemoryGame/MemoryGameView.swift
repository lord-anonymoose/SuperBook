//
//  MemoryGameView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 30.08.2024.
//

import SwiftUI
//import Inferno

struct MemoryGameView: View {

    // Show congrats message once game is over
    @State private var showCongrats = false
    
    // Check for device orientation
    @State private var orientation = UIDevice.current.orientation
    
    @StateObject private var memoryGame = MemoryGame()
    
    // Variable for storing an open card from previous move
    @State private var prevCard: Int? = nil
    
    // Timeout after a wrong move
    @State private var isInteractionDisabled = false

    @State private var rotationAngles = (0...18).map { _ in 0.0 }

    let columns = (1...6).map { _ in GridItem(.fixed(100)) }

    
    func flipCard(at index: Int) {
        if index < memoryGame.cards.count {
            withAnimation(Animation.linear(duration: 0.5)) {
                rotationAngles[index] += 180
                memoryGame.cards[index].turn()
            }
        }
    }
    
    func makeAMove(at index: Int) {
        // Check if the interface isn't frozen after the wrong turn
        guard !isInteractionDisabled else {
            return
        }
        
        // Check if it's not a second tap for the same card
        guard index != prevCard else {
            return
        }
        
        flipCard(at: index)
        
        // Check if the flipped card is the first out of two
        if prevCard == nil {
            prevCard = index
            return
        }
        // Otherwise it's the second
        
        // Check if two open cards match
        if memoryGame.cards[index].name == memoryGame.cards[prevCard!].name {
            prevCard = nil
            // Check if the game is finished now
            if memoryGame.cardsAreOpen.allSatisfy({$0}) {
                self.showCongrats = true
            }
        } else {
            isInteractionDisabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                flipCard(at: index)
                flipCard(at: prevCard!)
                prevCard = nil
                isInteractionDisabled = false
            }
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
                            .rotation3DEffect(.degrees(rotationAngles[i]), axis: (x: 0, y: 1, z: 0))
                            .onTapGesture {
                                makeAMove(at: i)
                            }
                    }
                }
            }
        }
        .alert("Congratulations! You did it!", isPresented: self.$showCongrats) {
            Button("Restart") {
                showCongrats = false
                memoryGame.start()
            }
        }
    }
}

#Preview {
    MemoryGameView()
}
