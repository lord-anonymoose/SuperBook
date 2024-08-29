//
//  ColorTheme.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 28.08.2024.
//

import SwiftUI

/*

@Observable class ColorTheme {
    enum Theme: String, CaseIterable {
        case system, light, dark
        
        static func themeFromTag(tag: Int) -> Theme {
            return Theme.allCases[tag]
        }
        
        var tag: Int {
            return Theme.allCases.firstIndex(of: self) ?? 0
        }
    }
    
    var current = Theme.system
    
    var theme: ColorScheme? {
        switch current {
            case .system: return nil
            case .light: return .light
            case .dark: return .dark
        }
    }
    
    init() {
        self.current = Theme.themeFromTag(tag: UserDefaults.standard.integer(forKey: "selectedTheme"))
    }
    
    func updateTheme(_ newTheme: Theme) {
        current = newTheme
        UserDefaults.standard.set(newTheme.tag, forKey: "selectedTheme")
    }
}



*/
