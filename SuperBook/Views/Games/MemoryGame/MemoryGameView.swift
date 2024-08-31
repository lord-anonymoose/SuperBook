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
                        self.memoryGame.cards[i].image
                            .resizable()
                            .scaledToFit()
                            .frame(height: imageSize)
                    }
                }
            }
        }
        .onAppear{
            self.memoryGame.loadImages()
        }
    }
}

#Preview {
    MemoryGameView()
}
