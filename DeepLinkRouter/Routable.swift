//
//  Routable.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/29.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation

public protocol Routable: AnyObject {
    var host: String { get set }

    var path: String { get set }

    var query: String { get set }

    var pathStack: [String] { get set }

    var handlerStack: [() -> Void] { get set }

    init(from: URL)

    func perform() -> Bool
}

public extension Routable {
    func perform() -> Bool {
        let givenLink = "\(host)\(path)"

        for (index, path) in pathStack.enumerated() {
            if path == givenLink {
                handlerStack[index]()
            }
        }

        return true
    }
}
