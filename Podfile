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
