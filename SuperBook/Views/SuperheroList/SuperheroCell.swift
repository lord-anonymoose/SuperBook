//
//  SuperHeroCell.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 17.08.2024.
//

import SwiftUI

struct SuperheroCell: View {
    @AppStorage("cellHeight") private var cellHeight = 100.0

    let imageURL: String?
    let name: String?
    let id: Int?
    
    var body: some View {
        HStack(spacing: 20) {
            if let url = URL(string: imageURL ?? "") {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 50, height: 50)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: CGFloat(cellHeight))
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: CGFloat(cellHeight))
                            .clipShape(Circle())
                    @unknown default:
                        fatalError()
                    }
                }
                .padding(.leading, 10)
            }
            
            VStack(alignment: .leading) {
                Text(name ?? "Unknown")
                    .font(.title3)
                    .fontWeight(.bold)
                
                if let unwrappedID = id {
                    Text(String(describing: unwrappedID))
                        .font(.footnote)
                        .fontWeight(.light)
                } else {
                    Text("Unknown")
                        .font(.footnote)
                        .fontWeight(.light)
                }
            }
            .frame(height: (CGFloat(cellHeight)))
            Spacer()
        }
    }
}

#Preview {
    SuperheroCell(imageURL: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/xs/1-a-bomb.jpg", name: "A-Bomb", id: 1)
}
