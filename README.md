# DeepLinkRouter

[![Version](https://img.shields.io/cocoapods/v/DeepLinkRouter.svg?style=flat)](http://cocoapods.org/pods/DeepLinkRouter)
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
github "shotastage/DeepLinkRouter" "0.0.1"
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
  
    	router.host("next",
                	Path("movie", {
                    	NSLog("Movie action detected.")  /// <-- This log will be displayed.
                	}),
      
                	Path("photo", {
                    	NSLog("Photo action detected.")
                	})
    	)
     
    	router.host("introduction",
                	Path("via_line", {
                    	NSLog("Go to reward page.")
                	}),
      
                	Path("via_email", {
                    	NSLog("Go to reward page.")
                	})
    	)

    	return true
	}

	...
}
```


## License

This software is freely distributed under the MIT, see [LICENSE](./LICENSE) for detail.
