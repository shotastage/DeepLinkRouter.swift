# Changelog


----
### Ver 0.0.3

- Introduce a new syntax

```swift
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
```

- Objective-C support has been deprecated.

----
### Ver 0.0.2

Add these classes for Objective-C

```
DLRouter
```

```
DLPath
```

---- 
### Ver 0.0.1

First release

----
