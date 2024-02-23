Pod::Spec.new do |s|
  s.name             = 'HxhProgressView'
  s.version          = '1.0.3'
  s.summary          = 'HxhProgressView is Gradient Progress View'
  s.description      = <<-DESC
  渐变进度条
                       DESC

  s.homepage         = 'https://github.com/ColorPenBoy/HxhProgressView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'colorpen' => 'zq252125@163.com' }
  s.source           = { :git => 'https://github.com/ColorPenBoy/HxhProgressView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'

  s.source_files = 'HxhProgressView/*.{h,m}'
  
  # s.resource_bundles = {
  #   '${POD_NAME}' => ['${POD_NAME}/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
