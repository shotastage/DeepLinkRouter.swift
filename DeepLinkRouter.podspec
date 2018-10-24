Pod::Spec.new do |s|
  s.name         = "DeepLinkRouter"
  s.version      = "0.0.2"
  s.summary      = "Router for iOS deep link."
  s.homepage     = "https://github.com/shotastage/DeepLinkRouter"
  s.license      = "MIT"
  s.author       = { "Shota Shimazu" => "hornet.live.mf@gmail.com" }
 
  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/shotastage/DeepLinkRouter.git", :tag => "#{s.version}" }
  s.source_files = 'DeepLinkRouter/*.{swift, h, m}'
end
