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
    
    
    /// Router Given Object State
    ///
    /// - path: If given object is Path
    /// - pathGroup: If given object is PathGroup
    /// - failure: If given object is not any Path object
    enum PathObjects {
        case path
        case pathGroup
        case failure
    }
    
    
    
    /// Evaluate and run closure when URL object match the given Path
    ///
    /// - Parameters:
    ///   - host: URL host ex. your-app://**this_is_host**/movie
    ///   - path: URL path ex. your-app://this_is_host/**movie**
    public func host(_ host: String, _ path: Path...) {

        /// Evaluate if host name is match
        if String(describing: self.host) == host {
            for f in path {
                if self.path == "/\(String(describing: f.path))" {

                    if self.decisionPathObject(object: f.self) == .path {
                        f.execute()
                    }
                    
                    else if self.decisionPathObject(object: f.self) == .pathGroup {
                        /// MARK: Not implemented path group
                    }
                    
                    else if self.decisionPathObject(object: f.self) == .failure {
                        fatalError("Registered object to router is not any Path object!")
                    }
                }
            }
        }
    }
    
    private func decisionPathObject<T>(object: T) -> PathObjects {
        if String(describing: type(of: object)) == "Path" {
            return .path
        }
        else if String(describing: type(of: object)) == "PathGroup" {
            return .pathGroup
        }
        else {
            print(String(describing: type(of: object)))
            
            return .failure
        }
    }
}
