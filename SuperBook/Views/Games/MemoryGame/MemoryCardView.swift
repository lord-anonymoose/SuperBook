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
    @State private var rotationAngle = 0.0
    @State private var contentRotationAngle = 0.0
    

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
        .rotation3DEffect(.degrees(contentRotationAngle), axis: (x: 0, y: 1, z: 0))
        .rotation3DEffect(.degrees(rotationAngle), axis: (x: 0, y: 1, z: 0))
    }
    
    public func turn() {
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime) ) {
            rotationAngle += 180.0
            //isOpen.toggle()
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotationAngle += 180.0
            isOpen.toggle()
        }
    }
}


/*
#Preview {
    MemoryCardView()
}
*/
