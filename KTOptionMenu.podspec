#
# Be sure to run `pod lib lint KTOptionMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KTOptionMenu'
  s.version          = '0.1.0'
  s.summary          = 'KTOptionMenu is a user-friendly framework to create attractive option menu'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A KTOptionMenu framework provies very interactive functionality to create easy to use option menu.
                       DESC

  s.homepage         = 'https://github.com/iOSDevKamal/KTOptionMenu'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iOSDevKamal' => 'kamaltrapasiya@gmail.com' }
  s.source           = { :git => 'https://github.com/iOSDevKamal/KTOptionMenu.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.swift_versions = '5.0'
  s.source_files = 'Source/**/*'
  
  # s.resource_bundles = {
  #   'KTOptionMenu' => ['KTOptionMenu/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
