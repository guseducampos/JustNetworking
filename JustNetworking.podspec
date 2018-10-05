Pod::Spec.new do |s|
  s.name         = "JustNetworking"
  s.version      = "2.0.0"
  s.summary      = "A tiny architecture library for simplify the networking layer"
  s.description  = <<-DESC
    Your description here.
  DESC
  s.homepage     = "https://github.com/guseducampos/JustNetworking"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Gustavo Campos" => "guseducampos@gmail.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.swift_version = "4.1"	
  s.source       = { :git => "https://github.com/guseducampos/JustNetworking.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
