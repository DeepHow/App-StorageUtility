#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
#
Pod::Spec.new do |s|
  s.name             = 'storage_utility_foundation'
  s.version          = '1.0.0'
  s.summary          = 'An iOS and macOS implementation of the storage_utility plugin.'
  s.description      = <<-DESC
  An iOS and macOS implementation of the Flutter plugin for easy access to device available storage space and total storage space across multiple platforms, including iOS, macOS, Android, and Windows.
                       DESC
  s.homepage         = 'https://github.com/DeepHow/App-StorageUtility/tree/main/storage_utility_foundation'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'DeepHow Corp.' => 'app+opensource@deephow.com' }
  s.source           = { :http => 'https://github.com/DeepHow/App-StorageUtility/tree/main/storage_utility_foundation' }
  s.source_files     = 'Classes/**/*'

  s.ios.dependency 'Flutter'
  s.osx.dependency 'FlutterMacOS'
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.14'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
