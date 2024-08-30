//
//  RotateDeviceView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 30.08.2024.
//

import SwiftUI

struct RotateDeviceView: View {
    @State private var isRotated = false
    @State private var showSecondImage = false
    
    var body: some View {
        VStack {
            Image(systemName: "arrowshape.turn.up.left.circle.fill")
                .font(.system(size: 25))
                .foregroundColor(.blue)
            Spacer()
            ZStack{
                Image(systemName: "iphone")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                    .opacity(showSecondImage ? 0 : 1)
                    .rotationEffect(Angle(degrees: isRotated ? -90 : 0), anchor: .center)
                    .animation(.linear(duration: 2), value: isRotated)
                
                Image(systemName: "iphone.landscape")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                    .opacity(showSecondImage ? 1 : 0)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isRotated.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        showSecondImage.toggle()
                    }
                }
            }
            Spacer()
            Text("Rotate your device!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 100)
        }
    }
}

#Preview {
    RotateDeviceView()
}
