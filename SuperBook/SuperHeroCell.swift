//
//  SuperHeroCell.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 17.08.2024.
//

import SwiftUI

struct SuperHeroCell: View {
    let image: Image
    let name: String
    let id: String
    
    var body: some View {
        HStack(spacing: 20) {
            image
                .frame(width: 50, height: 50)
            VStack {
                Text(name)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(id)
                    .font(.footnote)
                    .fontWeight(.light)
            }
            Spacer()
        }
        .padding(.leading, 20)
    }
}

#Preview {
    SuperHeroCell(image: Image(systemName: "person.circle").resizable(), name: "Name", id: "1")
}
