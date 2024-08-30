//
//  GameView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 30.08.2024.
//

import SwiftUI

struct GameView: View {
    @State private var orientation = UIDevice.current.orientation
    
    var body: some View {
        ZStack {
            if orientation == .portrait && UIDevice.current.userInterfaceIdiom == .phone {
                RotateDeviceView()
            } else if orientation == .portraitUpsideDown {
                
            } else if orientation == .landscapeLeft || orientation == .landscapeRight || UIDevice.current.userInterfaceIdiom == .pad {
                MemoryGameView()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                // Update orientation when it changes
            orientation = UIDevice.current.orientation
        }
    }
}

#Preview {
    GameView()
}
