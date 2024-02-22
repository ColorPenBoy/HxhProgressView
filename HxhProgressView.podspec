#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HxhProgressView'
  s.version          = '1.0.2'
  s.summary          = 'HxhProgressView is Gradient Progress View'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  渐变进度条
                       DESC

  s.homepage         = 'https://github.com/ColorPenBoy/HxhProgressView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'colorpen' => 'zq252125@163.com' }
  s.source           = { :git => 'https://github.com/ColorPenBoy/HxhProgressView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/colorpen_zxx'

  s.ios.deployment_target = '10.0'

  s.source_files = 'HxhProgressView/Classes/**/*'
  
  # s.resource_bundles = {
  #   '${POD_NAME}' => ['${POD_NAME}/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
