//
//  Router.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation

open class Router {
    var host: String
    var path: String
    var query: String?
    var pathStack: [String]
    var handlerStack: [() -> Void]

    public init?(from: URL) {
        guard let host = from.host else {
            return nil
        }

        self.host = host
        path = from.path
        query = from.query
        pathStack = []
        handlerStack = []
    }

    /// Register path and action to router
    ///
    /// - Parameters:
    ///   - path: URL path
    ///   - f: Router action (closure)
    /// - Returns: Router instance itself
    public func register(path: String, _ f: @escaping () -> Void) -> Router {
        pathStack.append(path)
        handlerStack.append(f)
        return self
    }

    /// Assess given URL and registered path

    @available(*, unavailable, renamed: "perform")
    public func performRouter() {}

    public func perform() {
        let givenLink = "\(host)\(path)"

        for (index, path) in pathStack.enumerated() {
            if path == givenLink {
                handlerStack[index]()
            }
        }
    }
}
