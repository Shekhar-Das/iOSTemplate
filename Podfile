# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'iOSTemplate' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'GoogleSignIn',:modular_headers => true
  pod 'IQKeyboardManager',:modular_headers => true
  pod 'Alamofire','~> 4.9.1',:modular_headers => true
  pod 'MBProgressHUD',:modular_headers => true
  pod 'RxAlamofire','~> 5.1.0',:modular_headers => true
  pod 'RxSwift',:modular_headers => true
  pod 'RxCocoa',:modular_headers => true
  pod 'SDWebImage',:modular_headers => true
  pod 'SwiftyJSON',:modular_headers => true
  pod 'FSCalendar',:modular_headers => true
  pod 'GooglePlaces',:modular_headers => true
  pod 'GoogleMaps' ,:modular_headers => true
  
  # Pods for iOSTemplate

  target 'iOSTemplateTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'iOSTemplateUITests' do
    # Pods for testing
  end
end

#post_install do |installer|
#  installer.pods_project.targets.each do |target|
#    target.build_configurations.each do |config|
#      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
#    end
#  end
#end
