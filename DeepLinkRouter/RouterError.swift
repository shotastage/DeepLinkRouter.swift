//
//  RouterError.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2024/11/22.
//  Copyright © 2024 Shota Shimazu. All rights reserved.
//

import Foundation

public enum RouterError: Error {
    case invalidHost
    case routeNotFound
    case invalidQuery
}

// Equatable conformance for testing
extension RouterError: Equatable {
    public static func == (lhs: RouterError, rhs: RouterError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidHost, .invalidHost),
             (.routeNotFound, .routeNotFound),
             (.invalidQuery, .invalidQuery):
            return true
        default:
            return false
        }
    }
}
