Pod::Spec.new do |s|
  s.name             = "WASKit"
  s.version          = "0.2.0"
  s.summary          = "WASKit Swift is a collection of useful classes, structs and extensions to develop Apps faster."

  s.homepage         = "https://github.com/salesawagner/waskit" 
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Wagner Sales" => "salesawagner@gmail.com" }
  s.source           = { :git => 'https://github.com/salesawagner/WASKIT.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.0'

  s.source_files     = "Sources/**/*.{swift}"
end
