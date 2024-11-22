//
//  Router.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018-2024 Shota Shimazu. All rights reserved.
//

import Foundation

/// A router class for handling deep links in the application
open class Router {
    // MARK: - Types
    
    /// Represents a registered route with its handler
    private struct Route {
        let path: String
        let handler: () -> Void
    }
    
    // MARK: - Properties
    
    private let host: String
    private let path: String
    private let queryParameters: [String: String]
    private var routes: [Route]
    
    // MARK: - Initialization
    
    /// Creates a new Router instance from a URL
    /// - Parameter url: The URL to initialize the router with
    /// - Throws: RouterError if the URL is invalid
    public init(from url: URL) throws {
        guard let host = url.host else {
            throw RouterError.invalidHost
        }
        
        self.host = host
        self.path = url.path
        self.routes = []
        self.queryParameters = Router.parseQueryParameters(from: url)
    }
    
    // MARK: - Public Methods
    
    /// Registers a new route with its handler
    /// - Parameters:
    ///   - path: The path to register
    ///   - handler: The closure to be executed when the route is matched
    /// - Returns: The router instance for method chaining
    @discardableResult
    public func register(path: String, handler: @escaping () -> Void) -> Router {
        let route = Route(path: path, handler: handler)
        routes.append(route)
        return self
    }
    
    /// Performs routing based on the initialized URL
    /// - Throws: RouterError.routeNotFound if no matching route is found
    /// - Returns: True if routing was successful
    @discardableResult
    public func perform() throws -> Bool {
        let givenLink = "\(host)\(path)"
        
        guard let matchedRoute = routes.first(where: { $0.path == givenLink }) else {
            throw RouterError.routeNotFound
        }
        
        matchedRoute.handler()
        return true
    }
    
    /// Returns the value for a specific query parameter
    /// - Parameter key: The key of the query parameter
    /// - Returns: The value of the query parameter if it exists
    public func queryValue(for key: String) -> String? {
        return queryParameters[key]
    }
    
    // MARK: - Private Methods
    
    /// Parses query parameters from a URL
    /// - Parameter url: The URL to parse
    /// - Returns: A dictionary of query parameters
    private static func parseQueryParameters(from url: URL) -> [String: String] {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else {
            return [:]
        }
        
        return Dictionary(uniqueKeysWithValues: queryItems.compactMap { item in
            guard let value = item.value else { return nil }
            return (item.name, value)
        })
    }
}

// MARK: - Router Convenience Methods

public extension Router {
    /// Registers multiple routes at once
    /// - Parameter routes: Dictionary of paths and their handlers
    /// - Returns: The router instance for method chaining
    @discardableResult
    func registerMultiple(_ routes: [String: () -> Void]) -> Router {
        routes.forEach { path, handler in
            register(path: path, handler: handler)
        }
        return self
    }
    
    /// Checks if a specific path is registered
    /// - Parameter path: The path to check
    /// - Returns: Boolean indicating if the path is registered
    func hasRoute(for path: String) -> Bool {
        let givenLink = "\(host)\(path)"
        return routes.contains { $0.path == givenLink }
    }
}

// MARK: - CustomStringConvertible

extension Router: CustomStringConvertible {
    public var description: String {
        """
        Router(
            host: \(host)
            path: \(path)
            queryParameters: \(queryParameters)
            registeredRoutes: \(routes.count)
        )
        """
    }
}
