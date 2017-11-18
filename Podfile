# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ios-gurunavi-apikit' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ios-gurunavi-apikit
	plugin 'cocoapods-keys', {
        :project => "ios-gurunavi-apikit",
        :keys => [
        "accessKey"
    ]}

    pod 'APIKit', '~> 3.1'
    
  target 'ios-gurunavi-apikitTests' do
    inherit! :search_paths
    # Pods for testing

    plugin 'cocoapods-keys', {
          :project => "ios-gurunavi-apikitTests",
          :keys => [
            "accessKey"
    ]}
        
    pod 'APIKit', '~> 3.1'
        
  end

end
