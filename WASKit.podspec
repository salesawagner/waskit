Pod::Spec.new do |s|
  s.name             = "WASKit"
  s.module_name      = "WASKit"
  s.version          = "0.1.0"
  s.summary          = "WASKit Swift is a collection of useful classes, structs and extensions to develop Apps faster."
  s.homepage         = "https://github.com/salesawagner/waskit"
  s.license          = {
                          :type => "MIT",
                          :file => "LICENSE"
                       }
  s.author           = { "Wagner Sales" => "salesawagner@gmail.com" }
  s.social_media_url = "https://twitter.com/salesawagner"
  s.platform         = :ios, "10.0"
  s.source           = {
                          :git => "https://github.com/salesawagner/WASKit.git",
                          :tag => s.version
                       }
  s.source_files     = "Sources/**/*.{swift}"
  s.requires_arc     = true
end
