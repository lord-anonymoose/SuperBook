//
//  MemoryCardView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 31.08.2024.
//

import SwiftUI

struct MemoryCardView: View {
    @State private var isOpen = true
    
    var body: some View {
        if isOpen {
            ZStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Rectangle()
                    .frame(width: 70, height: 100)
            }
                
        } else {
            Text("Goodbye, world!")
            
        }
    }
}

#Preview {
    MemoryCardView()
}
