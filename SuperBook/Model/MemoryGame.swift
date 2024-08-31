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


class MemoryGame: Game, ObservableObject {
    
    struct CardData {
        let image: Image
        let name: String
    }
    
    //@Published var images: [Image] = []
    @Published var cards: [CardData] = []
    
    init() {
        
    }
    
    func start() {
        
    }
    
    func finish() {
        
    }
    
    func loadImages() {
        NetworkService.getCharacters { heroes in
            // Choosing 9 random characters
            var superheroes = heroes.shuffled()
            for i in 0...superheroes.count - 1 {
                if let url = superheroes[i].images?.md {} else {
                    superheroes.remove(at: i)
                }
            }
            if superheroes.count > 9 {
                superheroes.removeLast(superheroes.count - 9)
            }
            
            // Loading 9 images of chosen characters
            let group = DispatchGroup()
            
            for superhero in superheroes {
                guard let url = URL(string: superhero.images?.md ?? "") else {
                    continue
                }
                
                // Enter the group before starting the task
                group.enter()
                
                URLSession.shared.dataTask(with: url) { data, response, error in
                    // Ensure data is received and no errors occurred
                    guard let data = data, error == nil else {
                        print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
                        group.leave() // Leave the group if there's an error
                        return
                    }
                    
                    // Saving loaded image to self.images
                    if let uiImage = UIImage(data: data) {
                        // Update the image on the main thread
                        DispatchQueue.main.async {
                            let image = Image(uiImage: uiImage)
                            let name = superhero.name ?? "Unknown"
                            self.cards.append(CardData(image: image, name: name))
                            //self.images.append(Image(uiImage: uiImage))
                            print(self.cards.count)
                        }
                    } else {
                        print("Failed to convert data to image")
                    }
                    
                    // Leave the group after the task is completed
                    group.leave()
                }.resume()
            }
            
            // Notify when all tasks are completed
            group.notify(queue: .main) {
                print("Finished loading all images")
                self.cards = (self.cards + self.cards).shuffled()
            }
        }
    }
}
