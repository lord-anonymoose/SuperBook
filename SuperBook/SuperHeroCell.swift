//
//  SuperHeroCell.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 17.08.2024.
//

import SwiftUI

struct SuperHeroCell: View {
    let imageURL: URL
    let name: String
    let id: String
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageURL) { phase in
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
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(id)
                    .font(.footnote)
                    .fontWeight(.light)
            }
            .frame(height: 70)
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding(5)
        .background(Color(white: 0.95))
        .cornerRadius(8)
    }
}

/*
#Preview {
    SuperHeroCell(image: Image(systemName: "person.circle").resizable(), name: "Name", id: "1")
}
*/
