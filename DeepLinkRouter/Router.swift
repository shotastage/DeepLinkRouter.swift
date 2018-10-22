//
//  Router.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation


open class Router {

    var host: String?
    var path: String?

    init(url: URL) {
        self.host = url.host as String?
        self.path = url.path as String?
    }
    
    public func host(_ host: String, _ path: Path...) {
        if self.host == host {
            for f in path {
                if self.path == "/\(String(describing: f.path))" {
                    f.execute()
                }
            }
        }
    }
}
