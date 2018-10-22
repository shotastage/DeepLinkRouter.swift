# DeepLinkRouter

DeepLinkRouter is deep link manager for Swift.


## Basic Usage

```swift
func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
    let router = Router(url: url)
        
    router.host("movie", {
        router.path("movie", {
            NSLog("LOG: Movie is launched.")
        })
            
        router.path("other", {
            NSLog("LOG: Other action is launched.")
        })
    })

    return true
}
```
