//
//  MemoryGameView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 30.08.2024.
//

import SwiftUI

struct MemoryGameView: View {
    @State private var orientation = UIDevice.current.orientation
    
    let imageURL = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/xs/1-a-bomb.jpg"
    
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
    ]
    
    private var imageSize = {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 140.0
        } else {
            return 70.0
        }
    }()
    
    
    var body: some View {
        ZStack {
            /*
            if orientation == .portrait && UIDevice.current.userInterfaceIdiom == .phone {
                RotateDeviceView()
            } else if orientation == .portraitUpsideDown {
                
            } else if orientation == .landscapeLeft || orientation == .landscapeRight || UIDevice.current.userInterfaceIdiom == .pad {*/
            LazyVGrid(columns: columns) {
                ForEach(0..<18) { i in
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
                                    .frame(height: imageSize)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: imageSize)
                                    .clipShape(Circle())
                            @unknown default:
                                fatalError()
                            }
                        }
                        .padding(.leading, 10)
                    }
                }
            }
        }
    }
}

#Preview {
    MemoryGameView()
}
