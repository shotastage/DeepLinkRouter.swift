//
//  Path.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation


open class Path {
    
    public let path: String?
    
    public let query: String?
    
    public let action: () -> Void
    
    public init(_ path: String, _ f: @escaping () -> Void, _ query: String? = nil) {
        self.path = path
        self.query = query
        self.action = f
    }
    
    func execute() {
        self.action()
    }
}


open class PathGroup {
    
    public var pathStack: [Path]?
    
    public let groupPath: String?

    
    public init(_ path: String, _ pathStack: Path...) {
        self.groupPath = path
        
        for path in pathStack {
            self.pathStack?.append(path)
        }
    }
    
}
