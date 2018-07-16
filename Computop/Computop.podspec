#
# Be sure to run `pod lib lint Computop.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                  = 'Computop'
  s.version               = '1.2.1'
  s.summary               = 'Computop SDK for iOS'
  # s.description         = 'Computop SDK for iOS'
  s.homepage              = 'https://github.com/computop/Computop-iOS.git'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'Philipp Homann' => 'philipp.homann@exozet.com' }
  s.source                = { :git => 'https://github.com/Computop/Computop-iOS.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.vendored_frameworks   = 'Computop/**/Computop.framework'

end


