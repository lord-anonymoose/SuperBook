//
//  ErrorService.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 16.08.2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case jsonError
    case networkError
    case httpResponseError
}

extension NetworkError {
    public var description: String {
        switch self {
        case .urlError:
            return String(localized: "The URL is not valid!", comment: "Error message")
        case .jsonError:
            return String(localized: "Couldn't parse JSON data!", comment: "Error message")
        case .networkError:
            return String(localized: "Your connection is lost!", comment: "Error message")
        case .httpResponseError:
            return String(localized: "HTTP Response Error!", comment: "Error message")
        }
    }
}
