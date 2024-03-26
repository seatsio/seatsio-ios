Pod::Spec.new do |s|
  s.name             = 'seatsio'
  s.version          = '14.4.0'
  s.summary          = 'The official Seats.io library for iOS'
  s.homepage         = 'https://github.com/seatsio/seatsio-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/seatsio/seatsio-ios.git', :tag => s.version.to_s }
  s.authors          = { 'The Seats.io team' => 'dev@seats.io' }
  s.ios.deployment_target = '8.0'
  s.source_files = 'seatsio-ios/*'
  s.exclude_files = "seatsio-ios/**/*.plist"
  s.swift_versions = ['4.0']
  s.dependency 'JustBridge', '~> 4.2.0'
end
