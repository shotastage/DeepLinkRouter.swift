//
//  ObjRouter.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/23.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation


@objc(DLRouter)
@available(swift, obsoleted: 99)
open class DLRouter: NSObject {
    
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
    
    @objc
    public func register(path: String, _ f: @escaping () -> Void) -> DLRouter {
        
        /// Add path to stack
        self.pathStack.append(path)
        
        /// Add handler to stack
        self.handlerStack.append(f)
        return self
    }
    
    @objc
    public func performRouter() {
        
        let givenLink: String = "\(host)\(path)"
        
        for (index, path) in pathStack.enumerated() {
            
            if path == givenLink {
                handlerStack[index]()
            }
        }
    }
}
