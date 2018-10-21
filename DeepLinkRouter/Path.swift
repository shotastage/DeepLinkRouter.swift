//
//  Path.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation


open class Path {
    
    var path: String?
    
    var query: String?
    
    init(path: String, query: String) {
        self.path = path
        self.query = query
    }
}


open class PathGroup {
    
    var pathStack: [Path]?
    
    let groupPath: String?
    
    init(path: String) {
        self.groupPath = path
    }
    
}
