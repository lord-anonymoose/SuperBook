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
            return "The URL is not valid!".localized
        case .jsonError:
            return "Couldn't parse JSON data!".localized
        case .networkError:
            return "Your connection is lost!".localized
        case .httpResponseError:
            return "HTTP Response Error!".localized
        }
    }
}
