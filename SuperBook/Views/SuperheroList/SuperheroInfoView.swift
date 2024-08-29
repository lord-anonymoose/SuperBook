//
//  SuperheroInfoView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 29.08.2024.
//

import SwiftUI

struct SuperheroInfoView: View {
    @State private var superhero: Superhero
    
    init(superhero: Superhero) {
        self.superhero = superhero
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    if let url = URL(string: superhero.images?.md ?? "") {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 120)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 120)
                                    .clipShape(Circle())
                            @unknown default:
                                fatalError()
                            }
                        }
                        .padding(.leading, 10)
                        
                        Spacer()
                        Text(superhero.name ?? "Unknown")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
            }
            
            /*
             
             "powerstats": {
               "intelligence": 50,
               "strength": 90,
               "speed": 53,
               "durability": 64,
               "power": 99,
               "combat": 65
             },
             */
            
            Section(header: Text("Statistics")) {
                HStack {
                    Image(systemName: "brain.fill")
                    Text("Intelligence: \(superhero.powerstats?.intelligence ?? 0)")
                }
                HStack {
                    Image(systemName: "dumbbell.fill")
                    Text("Strength: \(superhero.powerstats?.strength ?? 0)")
                }
                HStack {
                    Image(systemName: "wind")
                    Text("Speed: \(superhero.powerstats?.speed ?? 0)")
                }
                HStack {
                    Image(systemName: "shield.lefthalf.filled")
                    Text("Durability: \(superhero.powerstats?.durability ?? 0)")
                }
                HStack {
                    Image(systemName: "battery.100percent.bolt")
                    Text("Power: \(superhero.powerstats?.power ?? 0)")
                }
                HStack {
                    Image(systemName: "figure.boxing")
                    Text("Combat: \(superhero.powerstats?.combat ?? 0)")
                }
            }
        }
    }
}

/*
#Preview {
    SuperheroInfoView()
}
*/
