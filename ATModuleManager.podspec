Pod::Spec.new do |s|
  s.name         = "ATModuleManager"
  s.version      = "0.0.2"
  s.summary      = "ATModuleManager for iOS"
  s.homepage     = "https://github.com/linzhiman/ATModuleManager"
  s.license      = "MIT"
  s.author             = { "linzhiman" => "154298785@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/linzhiman/ATModuleManager", :tag => "#{s.version}" }
  s.source_files = "ATModuleManager/**/*.{h,m}"
end
