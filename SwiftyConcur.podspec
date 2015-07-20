Pod::Spec.new do |spec|
  spec.name             = 'SwiftyConcur'
  spec.version          = '0.0.6'
  spec.license          = 'Apache 2.0' 
  spec.homepage         = 'https://github.com/concurlabs/SwiftyConcur'
  spec.authors          = 'Concur Technologies'
  spec.summary          = 'Swift SDK for the Concur APIs'
  spec.source           = { :git => 'https://github.com/concurlabs/SwiftyConcur.git', :tag => '0.0.6' }
  spec.source_files     = 'Source/*.swift'
  spec.ios.deployment_target = '8.0'
  spec.dependency 'Alamofire', '~> 1.2.3'
  spec.dependency 'SwiftyJSON', '~> 2.2.0'
end
