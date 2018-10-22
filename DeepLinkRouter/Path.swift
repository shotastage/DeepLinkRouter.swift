//
//  Path.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation


open class Path {
    
    let path: String?
    
    let query: String?
    
    let action: () -> Void
    
    init(_ path: String, _ f: @escaping () -> Void, _ query: String? = nil) {
        self.path = path
        self.query = query
        self.action = f
    }
    
    func execute() {
        self.action()
    }
}


open class PathGroup {
    
    var pathStack: [Path]?
    
    let groupPath: String?

    
    init(_ path: String, _ pathStack: Path...) {
        self.groupPath = path
        
        for path in pathStack {
            self.pathStack?.append(path)
        }
    }
    
}
