# DeepLinkRouter

[![Build Status](https://travis-ci.org/shotastage/DeepLinkRouter.swift.svg?branch=master)](https://travis-ci.org/shotastage/DeepLinkRouter.swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/shotasatge/DeepLinkRouter.swift)
[![Version](https://img.shields.io/cocoapods/v/DeepLinkRouter.svg?style=flat)](http://cocoapods.org/pods/DeepLinkRouter)
[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org/)
[![License](https://img.shields.io/cocoapods/l/DeepLinkRouter.svg?style=flat)](http://cocoapods.org/pods/DeepLinkRouter)
[![Platform](https://img.shields.io/cocoapods/p/DeepLinkRouter.svg?style=flat)](http://cocoapods.org/pods/DeepLinkRouter)

DeepLinkRouter is a type-safe and feature-rich deep link routing manager for Swift applications.

## Features

- Type-safe routing with error handling
- Query parameter support
- Method chaining for route registration
- Multiple route registration at once
- Performance optimized
- Comprehensive testing support

## Installation

### CocoaPods

```ruby
pod 'DeepLinkRouter'
```

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/shotastage/DeepLinkRouter.git", from: "1.0.0")
]
```

### Carthage

```
github "shotastage/DeepLinkRouter"
```

## Basic Usage

First, import DeepLinkRouter and implement URL handling in your AppDelegate:

```swift
import UIKit
import DeepLinkRouter

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        do {
            let router = try Router(from: url)

            // Register routes with method chaining
            try router
                .register(path: "next/movie") {
                    print("Movie action launched")
                }
                .register(path: "next/photo") {
                    print("Photo action launched")
                }
                .perform()

            // Or register multiple routes at once
            router.registerMultiple([
                "next/music": { print("Music action launched") },
                "next/books": { print("Books action launched") }
            ])

            return true
        } catch RouterError.invalidHost {
            print("Invalid URL host")
            return false
        } catch RouterError.routeNotFound {
            print("No matching route found")
            return false
        } catch {
            print("Unexpected error: \(error)")
            return false
        }
    }
}
```

## Advanced Usage

### Working with Query Parameters

```swift
let router = try Router(from: url) // url: "your-app://next/movie?id=123&type=action"

// Access query parameters
if let movieId = router.queryValue(for: "id"),
   let movieType = router.queryValue(for: "type") {
    print("Movie ID: \(movieId), Type: \(movieType)")
}
```

### Route Existence Check

```swift
if router.hasRoute(for: "next/movie") {
    print("Route exists")
}
```

### Multiple Route Registration

```swift
let routes = [
    "next/movie": { /* handle movie route */ },
    "next/photo": { /* handle photo route */ },
    "next/music": { /* handle music route */ }
]

router.registerMultiple(routes)
```

## Error Handling

The router provides three types of errors:

```swift
public enum RouterError: Error {
    case invalidHost    // URL host is missing or invalid
    case routeNotFound  // No matching route found
    case invalidQuery   // Query parameter parsing failed
}
```

## Best Practices

1. Always use `try-catch` blocks when working with the router
2. Keep route paths consistent and well-documented
3. Use meaningful path names that reflect the action or resource
4. Consider implementing a central route registry
5. Add logging for debugging purposes

## Example Project

Check out our example project in the [Example](./Example) directory for a complete implementation.

## Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

## License

This software is freely distributed under the MIT license. See [LICENSE](./LICENSE) for details.
