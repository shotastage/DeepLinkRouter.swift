//
//  Routable.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/29.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation


public protocol Routable: class {
    
    init(_ url: URL)
    
    func perform() -> Bool
}


extension Routable {
    func perform() -> Bool {
        return true
    }
}
