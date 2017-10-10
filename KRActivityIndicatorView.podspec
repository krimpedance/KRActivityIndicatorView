Pod::Spec.new do |s|
  s.name         = "KRActivityIndicatorView"
  s.version      = "2.1.1"
  s.summary      = "A simple and customizable activity indicator."
  s.description  = "KRActivityIndicatorView is a simple and customizable activity indicator on iOS."
  s.homepage     = "https://github.com/krimpedance/KRActivityIndicatorView"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "krimpedance" => "krimpedance@gmail.com" }
  s.requires_arc = true
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'

  s.source       = { :git => "https://github.com/krimpedance/KRActivityIndicatorView.git", :tag => s.version.to_s }
  s.source_files = "KRActivityIndicatorView/**/*.swift"
end
