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
    
    let path: String
    
    var pathStack: [Path]

    
    public init(from: URL) {
        self.host = from.host!
        self.path = from.path
        self.pathStack = []
    }

    public func add(_ entry: String, _ f: @escaping (_ link: inout Router) -> Void) {
    }
    
    public func path(_ entry: String, _ path: (_ add : Int) -> Void) {
        self.pathStack.append(Path(entry))
        
        
    }
}
