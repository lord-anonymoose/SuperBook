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
        Text(superhero.name ?? "Unknown")
    }
}

/*
#Preview {
    SuperheroInfoView()
}
*/
