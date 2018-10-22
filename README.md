# DeepLinkRouter

DeepLinkRouter is deep link manager for Swift.


## Basic Usage

**`URL: your-app://next/movie`**

```swift
func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
    let router = Router(url: url)
        
    router.host("next", {
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
