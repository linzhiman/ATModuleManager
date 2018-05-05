Pod::Spec.new do |s|
  s.name         = "ATModuleManager"
  s.version      = "0.0.4"
  s.summary      = "#{s.name} for iOS"
  s.homepage     = "https://github.com/linzhiman/#{s.name}"
  s.license      = "MIT"
  s.author             = { "linzhiman" => "154298785@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/linzhiman/#{s.name}", :tag => "#{s.version}" }
  s.source_files = "#{s.name}/**/*.{h,m}"
end
