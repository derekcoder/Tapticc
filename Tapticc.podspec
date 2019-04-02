Pod::Spec.new do |s|
  s.name             = 'Tapticc'
  s.version          = '1.1.0'
  s.summary          = 'Easy way to use haptic feedback through Taptic Engine in iOS.'

  s.description      = <<-DESC
  Tapticc provides a easy way to use haptic feedback through Taptic Engine in iOS.
                       DESC

  s.homepage         = 'https://github.com/derekcoder/Tapticc'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'derekcoder' => 'derekcoder@gmail.com' }
  s.source           = { :git => 'https://github.com/derekcoder/Tapticc.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/derekcoder_'
  
  s.ios.deployment_target = '10.0'
  
  s.swift_version = '5.0'

  s.source_files = 'Tapticc/Classes/**/*'
  
  s.resource_bundles = {
    'Tapticc' => ['Tapticc/Assets/*.png']
  }
end
