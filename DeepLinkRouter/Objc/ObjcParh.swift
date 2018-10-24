//
//  ObjcParh.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/23.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import Foundation


@objc(DLPath)
@available(swift, obsoleted: 99)
open class DLPath: NSObject {
    
    public let path: String
    
    public let query: String
    
    public let action: () -> Void
    
    
    public init(_ path: String, _ f: @escaping () -> Void, _ query: String = "") {
        self.path = path
        self.query = query
        self.action = f
    }
    
    func execute() {
        self.action()
    }
}


@objc(DLPathGroup)
@available(swift, obsoleted: 99)
open class DLPathGroup: NSObject {
    
    public var pathStack: [Path]?
    
    public let groupPath: String?
    
    
    public init(_ path: String, _ pathStack: Path...) {
        self.groupPath = path
        
        for path in pathStack {
            self.pathStack?.append(path)
        }
    }
}
