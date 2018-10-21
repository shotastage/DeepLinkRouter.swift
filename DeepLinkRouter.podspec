Pod::Spec.new do |s|
  s.name         = "DeepLinkRouter"
  s.version      = "0.0.1"
  s.summary      = "Router for iOS deep link."
  s.homepage     = "https://github.com/shotastage/DeepLinkRouter"
  s.license      = "MIT"
  s.author             = { "Shota Shimazu" => "hornet.live.mf@gmail.com" }
 
  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/shotastage/DeepLinkRouter.git", :tag => "#{s.version}" }
  s.source_files = 'DeepLinkRouter/**/*.{swift,, h, m}'
  s.exclude_files = "Classes/Exclude"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
end
