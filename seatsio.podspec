Pod::Spec.new do |s|
  s.name             = 'seatsio'
  s.version          = '17.0.0'
  s.summary          = 'The official Seats.io library for iOS'
  s.homepage         = 'https://github.com/seatsio/seatsio-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/seatsio/seatsio-ios.git', :tag => s.version.to_s }
  s.authors          = { 'The Seats.io team' => 'dev@seats.io' }
  s.ios.deployment_target = '12.0'
  s.source_files = 'Sources/seatsio-ios/*'
  s.exclude_files = "Sources/seatsio-ios/**/*.plist"
  s.swift_versions = ['4.0']
end
