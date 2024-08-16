//
//  ContentView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 16.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Spacer()
            Button("Click me!") {
                NetworkService.getCharacters { heroes in
                    DispatchQueue.main.async {
                        for hero in heroes {
                            print(hero.id)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
