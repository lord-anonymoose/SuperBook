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

    @Binding var showHeaders: Bool

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("App Interface")) {
                    Picker("What is your favorite color?", selection: $preferredTheme) {
                        Text("System").tag(0)
                        Text("Light").tag(1)
                        Text("Dark").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding(.top, 20)
                    Toggle("Show headers:", isOn: $showHeaders)
                }
                
                Section(header: Text("Content size: \(sliderValue)")) {
                    Text("Yo!")
                    Slider(value: $sliderValue)
                }
            }
            .navigationTitle(showHeaders ? "Settings" : "")
        }
    }
}

/*
#Preview {
    SettingsView(showHeaders: <#Binding<Bool>#>)
}
*/
