Pod::Spec.new do |s|
  s.name             = "WASKit"
  s.module_name      = "WASKit"
  s.version          = "0.0.1"
  s.summary          = "WASKit Swift is a collection of useful classes to develop Apps faster"
  s.homepage         = "http://www.wagnersales.com.br/WASKit"
  s.license          = "MIT (example)"
  s.author           = { "Wagner Sales" => "salesawagner@gmail.com" }
  s.platform         = :ios, "9.0"
  s.source           = {
                          :git => "https://github.com/salesawagner/WASKit.git",
                          :tag => "v0.0.1"
                       }
  s.source_files     = "Source/**/*.{swift}"
  s.resources        = "Source/Languages/**"
  s.requires_arc     = true
end