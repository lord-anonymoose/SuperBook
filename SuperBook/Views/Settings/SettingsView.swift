//
//  SettingsView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 28.08.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var sliderValue: Double = 0
    
    @AppStorage("preferredTheme") private var preferredTheme = 0


    var body: some View {
        Form {
            Section(header: Text("Theme")) {
                Picker("What is your favorite color?", selection: $preferredTheme) {
                    Text("System").tag(0)
                    Text("Light").tag(1)
                    Text("Dark").tag(2)
                }
                .pickerStyle(.segmented)

            }
            Section(header: Text("Headers")) {
                Text("Yet Another Hello!")
            }
            Section(header: Text("Content size: \(sliderValue)")) {
                Text("Yo!")
                Slider(value: $sliderValue)
            }
        }
    }
}

#Preview {
    SettingsView()
}
