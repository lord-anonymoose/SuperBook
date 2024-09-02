//
//  String.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 30.08.2024.
//

import Foundation


extension String {
    var localized: String {
        String(localized: String.LocalizationValue(self))
    }
}
