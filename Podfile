# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

def default_pods
  inhibit_all_warnings!

  pod 'Kingfisher', '~> 5.0'
  pod 'ReactiveCocoa', '~> 10.1'
  pod 'Result', '~> 5.0'
  pod 'SnapKit', '~> 5.0.0'
  pod 'SwiftGen', '~> 6.0'
  pod 'SwiftLint'
end

target 'NintendoGallery' do
  default_pods
end

target 'NintendoGalleryTests' do
  default_pods
end

# Makes sure each pod's IPHONEOS_DEPLOYMENT_TARGET is 13.0
post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
