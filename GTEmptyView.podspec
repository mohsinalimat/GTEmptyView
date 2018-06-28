Pod::Spec.new do |s|
  s.name             = 'GTEmptyView'
  s.version          = '1.0.0'
  s.summary          = 'so esay integrate empty content view'

  s.homepage         = 'https://github.com/liuxc123/GTEmptyView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liuxc123' => 'lxc_work@126.com' }
  s.source           = { :git => 'https://github.com/liuxc123/GTEmptyView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'GTEmptyView/Classes/**/*'

  s.frameworks = 'UIKit', 'Foundation'

  s.public_header_files = 'GTEmptyView/Classes/GTEmptyViewHeader.h'

end
