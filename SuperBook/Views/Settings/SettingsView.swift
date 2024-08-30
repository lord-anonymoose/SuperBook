//
//  SettingsView.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 28.08.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var sliderValue: Double = 0
    @State private var showEditor = false
    
    @AppStorage("preferredTheme") private var preferredTheme = 0
    @AppStorage("showHeaders") private var showHeaders: Bool = false
    @AppStorage("cellHeight") private var cellHeight = 100.0


    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("App Interface")) {
                    Picker(String("Choose theme"), selection: $preferredTheme) {
                        Text("System").tag(0)
                        Text("Light").tag(1)
                        Text("Dark").tag(2)
                    }
                    .pickerStyle(.segmented)
                    Toggle("Show headers:", isOn: $showHeaders)
                    HStack {
                        Text("Content size: \(Int(cellHeight))")
                            .onTapGesture {
                                showEditor.toggle()
                            }
                        Spacer()
                        if showEditor {
                            Image(systemName: "arrowtriangle.down.fill")
                        } else {
                            Image(systemName: "arrowtriangle.right.fill")
                        }
                    }
                    .onTapGesture {
                        showEditor.toggle()
                    }
                    if showEditor {
                        Slider(value: $cellHeight, in: 70.0 ... 120.0, step: 1.0)
                        SuperheroCell(imageURL: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/sm/1-a-bomb.jpg", name: "A-Bomb", id: 1)
                    }
                }
            }
            .navigationTitle(showHeaders ? "Settings".localized : "")
        }
    }
}

/*
#Preview {
    SettingsView(showHeaders: <#Binding<Bool>#>)
}
*/
