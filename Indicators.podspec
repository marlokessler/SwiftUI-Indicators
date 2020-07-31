Pod::Spec.new do |spec|

  spec.name         = "Indicators"
  spec.version      = "1.3.0"
  spec.summary      = "A set of useful Extensions in Swift."
  spec.homepage     = "https://github.com/Connapptivity/SwiftUI-Indicators"

  spec.license      = { :type => "Restricted", :file => "LICENSE" }

  spec.author       = { "Marlo Kessler" => "marlo.kessler@connapptivity.de" }

  spec.ios.deployment_target     = "13.0"
  spec.osx.deployment_target     = "10.15"
  spec.watchos.deployment_target = "6.0"
  spec.tvos.deployment_target    = "13.0"

  spec.source = { :git => "https://github.com/Connapptivity/SwiftUI-Indicators.git", :tag => "#{spec.version}" }
  
  spec.source_files  = "Sources", "Sources/**/*.{swift}"
  spec.exclude_files = "Sources/Exclude"
  
  spec.framework  = "Foundation"
  
end
