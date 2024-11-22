//
//  Routable.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/29.
//  Copyright © 2018-2024 Shota Shimazu. All rights reserved.
//

import Foundation

public protocol Routable: AnyObject {
    var host: String { get }
    var path: String { get }
    var query: [String: String] { get }
    
    // Manage and organize related data using tuples.
    var routes: [(path: String, handler: () -> Void)] { get }
    
    init(from url: URL) throws
}

// Define error types related to routing
public enum RoutingError: Error {
    case invalidURL
    case routeNotFound
    case malformedQuery
}

public extension Routable {
    func perform() throws -> Bool {
        let givenLink = "\(host)\(path)"
        
        guard let route = routes.first(where: { $0.path == givenLink }) else {
            throw RoutingError.routeNotFound
        }
        
        route.handler()
        return true
    }
    
    func parseQueryParameters(from url: URL) -> [String: String] {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else {
            return [:]
        }
        
        return Dictionary(uniqueKeysWithValues: queryItems.map {
            ($0.name, $0.value ?? "")
        })
    }
}
