
Pod::Spec.new do |s|
  s.name         = 'GDPKit-Swift'
  s.version      = '0.0.1'
  s.summary      = 'A collection of iOS components.'
  s.homepage     = 'https://github.com/sunmumu/GDPKit-Swift'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'sunmumu' => '335089101@qq.com' }
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/sunmumu/GDPKit-Swift.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'GDPKit-Swift/**/*.{h,m}'
  s.public_header_files = 'GDPKit-Swift/**/*.{h}'
  
  s.libraries = 'z'
  s.frameworks = 'UIKit', 'CoreFoundation'
  # s.ios.vendored_frameworks = 'Vendor/WebP.framework'
  

end