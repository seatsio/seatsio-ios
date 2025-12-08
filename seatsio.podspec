Pod::Spec.new do |s|
    s.name             = 'seatsio'
    s.version          = '20.3.0'
    s.summary          = 'The official Seats.io library for iOS'
    s.homepage         = 'https://github.com/seatsio/seatsio-ios'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.source           = { :git => 'https://github.com/seatsio/seatsio-ios.git', :tag => s.version.to_s }
    s.authors          = { 'The Seats.io team' => 'dev@seats.io' }
    s.ios.deployment_target = '12.0'
    s.source_files = 'Seatsio/Sources/*'
    s.swift_version = '5.0'
    s.dependency 'SwiftyJSON', '5.0.2'
end
