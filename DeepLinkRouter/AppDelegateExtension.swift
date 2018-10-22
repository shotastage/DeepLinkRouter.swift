//
//  AppDelegateExtension.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/22.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import UIKit



public protocol DeepLinkRouter: class { }


struct AssociatedKey {
    static var routerKey: Router? = nil
}


extension DeepLinkRouter where Self: UIApplicationDelegate {
    
    private(set) var router: Router {
        get {
            if (objc_getAssociatedObject(self, &AssociatedKey.routerKey) as? Router) != nil {
                return self.router
            }
            
            let initial = Router(url: URL(string: "default://root")!)
            objc_setAssociatedObject(self, &AssociatedKey.routerKey, initial, .OBJC_ASSOCIATION_RETAIN)
            
            return initial
        }
        
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKey.routerKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    
        self.router = Router(url: url)

        return true
    }

}
