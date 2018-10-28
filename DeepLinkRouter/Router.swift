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
    
    var pathStack: [String]
    
    public init(from: URL) {
        self.host = from.host!
        self.path = from.path
        self.pathStack = []
    }
    
    public func register(path: String, _ f: @escaping () -> Void) -> Router {
        self.pathStack.append(path)
        return self
    }
    
    public func performRouter() {
        print("Read all router")
        for path in pathStack {
            print(path)
        }
    }
}
