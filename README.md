# DeepLinkRouter

DeepLinkRouter is deep link manager for Swift.


## Basic Usage

**`URL: your-app://host/path`**

`ex. your-app://next/movie`

```swift
func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
    let router = Router(url: testURLInstance)
                
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
```
