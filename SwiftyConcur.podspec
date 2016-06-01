Pod::Spec.new do |spec|
  spec.name             = 'SwiftyConcur'
  spec.version          = '0.1.1'
  spec.license          = 'Apache 2.0' 
  spec.homepage         = 'https://github.com/concurlabs/SwiftyConcur'
  spec.authors          = 'Concur Concept Lab'
  spec.summary          = 'Swift SDK for the Concur APIs'
  spec.source           = { :git => 'https://github.com/concurlabs/SwiftyConcur.git', :tag => '0.1.1' }
  spec.source_files     = 'Source/*.swift'
  spec.ios.deployment_target = '9.0'
  spec.dependency 'Alamofire', '~> 3.4'
  spec.dependency 'SwiftyJSON', '~> 2.3.1'
end
