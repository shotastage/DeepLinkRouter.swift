//
//  Router.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/21.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation


open class Router {
    
    var groupStack: [Path]
    
    init() {
        self.groupStack = [Path(path: "")]
    }
    
    public func path(_ path: Path, _: () -> Void) {
        
    }
}
