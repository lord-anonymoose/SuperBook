//
//  MemoryCardView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 31.08.2024.
//

import SwiftUI

struct MemoryCardView: View {
    @Binding var isOpen: Bool
    let image: Image
    let name: String
    

    private var imageSize = {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 200.0
        } else {
            return 100.0
        }
    }()

    
    init(isOpen: Binding<Bool>, image: Image, name: String) {
        self._isOpen = isOpen
        self.image = image
        self.name = name
    }
    
    var body: some View {
        ZStack {
            if isOpen {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: imageSize)
            }
            else {
                Image("CardCoverImage")
                    .resizable()
                    .scaledToFit()
                    .frame(height: imageSize)
            }
        }
    }
    
    public func turn() {
        isOpen.toggle()
    }
}
