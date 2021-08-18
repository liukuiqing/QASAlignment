#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QASAlignment'
  s.version          = '1.0'
  s.summary          = 'A short description of QASAlignment.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/liukuiqing/QASAlignment'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '18155167935@163.com' }
  s.source           = { :git => 'https://github.com/liukuiqing/QASAlignment.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'QASAlignment/QASAlignment/*'
  

  s.frameworks = 'UIKit'
end
