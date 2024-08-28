//
//  SuperHeroCell.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 17.08.2024.
//

import SwiftUI

struct SuperheroCell: View {
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
                            .frame(height: 70)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
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
            .frame(height: 70)
            Spacer()
        }
    }
}

/*
#Preview {
    SuperHeroCell(image: Image(systemName: "person.circle").resizable(), name: "Name", id: "1")
}
*/
