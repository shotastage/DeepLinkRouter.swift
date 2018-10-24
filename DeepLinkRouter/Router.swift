//
//  Router.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation


open class Router: NSObject {

    var host: String
    var path: String

    public init(from: URL) {
        self.host = from.host!
        self.path = from.path
    }
    
    public func host(_ host: String, _ path: Path...) {

        if String(describing: self.host) == host {
            for f in path {
                if self.path == "/\(String(describing: f.path))" {
                    f.execute()
                }
            }
        }
    }
}
