//
//  AppDelegateExtension.swift
//  DeepLinkRouter
//
//  Created by Shota Shimazu on 2018/10/22.
//  Copyright © 2018 Shota Shimazu. All rights reserved.
//

import UIKit


public protocol DeepLinkRouter: class {
    var router: Router { get set }
}

extension DeepLinkRouter where Self: UIApplicationDelegate {
    
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    
        self.router = Router(url: url)

        return true
    }

}
