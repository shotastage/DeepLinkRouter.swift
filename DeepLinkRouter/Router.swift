//
//  Router.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation


open class Router {
    
    var groupStack: [Path]?
    var pathStack: [Path]?

    var host: String?
    var path: String?

    init(url: URL) {
        self.host = url.host as String?
        self.path = url.path as String?
    }
    
    public func path(_ path: String, _ f: () -> Void) {
        if self.path == path {
            f()
        }
    }
}
