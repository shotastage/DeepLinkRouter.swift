# DeepLinkRouter

[![Build Status](https://travis-ci.org/shotastage/DeepLinkRouter.swift.svg?branch=master)](https://travis-ci.org/shotastage/DeepLinkRouter.swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/shotasatge/DeepLinkRouter.swift)
[![Version](https://img.shields.io/cocoapods/v/DeepLinkRouter.svg?style=flat)](http://cocoapods.org/pods/DeepLinkRouter)
[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org/)
[![License](https://img.shields.io/cocoapods/l/DeepLinkRouter.svg?style=flat)](http://cocoapods.org/pods/DeepLinkRouter)
[![Platform](https://img.shields.io/cocoapods/p/DeepLinkRouter.svg?style=flat)](http://cocoapods.org/pods/DeepLinkRouter)

DeepLinkRouter is deep link manager for Swift.


## Installation

**CocoaPods**

```
pod 'DeepLinkRouter'
```


**Carthage**

```
github "shotastage/DeepLinkRouter" "0.0.3"
```


## Basic Usage

First, import DeepLinkRouter.
THen, override `func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey :Any] = [:]) -> Bool` and register host & path like below.


**`URL: your-app://host/path`**

**Example**
`your-app://next/movie`


```swift
import UIKit
import DeepLinkRouter


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    ...
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    
        let router = Router(from: url)
                
        router
            .register(path: "next/movie", {
                NSLog("LOG: Movie action has been launched!")
            })
        
            .register(path: "next/photo", {
                NSLog("LOG: Photo action has been launched!")
            })
        
            .register(path: "next/music", {
                NSLog("LOG: Music action has been launched!")
            })
        
            .performRouter()

        return true
    }
    
    ...


}
```


## License

This software is freely distributed under the MIT, see [LICENSE](./LICENSE) for detail.
