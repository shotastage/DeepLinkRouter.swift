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
    
    var handlerStack: [() -> Void]
    
    public init(from: URL) {
        self.host = from.host!
        self.path = from.path
        self.pathStack = []
        self.handlerStack = []
    }
    
    public func register(path: String, _ f: @escaping () -> Void) -> Router {
        
        /// Add path to stack
        self.pathStack.append(path)
        
        /// Add handler to stack
        self.handlerStack.append(f)
        return self
    }
    
    public func performRouter() {
        
        let givenLink: String = "\(host)\(path)"
        
        for (index, path) in pathStack.enumerated() {
            
            if path == givenLink {
                handlerStack[index]()
            }
        }
    }
}
