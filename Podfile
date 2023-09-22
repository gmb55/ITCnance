platform :ios, '16.0'

use_frameworks!

def all_pods
  pod 'CryptoSwift'
end

target 'ITCnance' do
  all_pods

  target 'ITCnanceTests' do
    inherit! :search_paths
    all_pods
  end

  target 'ITCnanceUITests' do
    all_pods
  end
end

target 'ITCnance - Staging' do
  all_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    target.build_configurations.each do |config|
      xcconfig_path = config.base_configuration_reference.real_path
      xcconfig = File.read(xcconfig_path)
      xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
      File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
    end
  end
end