//
//  ColorThemeService.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 29.08.2024.
//

import Foundation
import SwiftUI

struct ColorThemeService {
    static func themeFromTag(_ tag: Int) -> ColorScheme? {
        switch tag {
        case 1: return .light
        case 2: return .dark
        default: return nil
        }
    }
    
}
