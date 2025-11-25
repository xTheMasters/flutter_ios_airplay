Pod::Spec.new do |s|
  s.name             = 'flutter_ios_airplay'
  s.version          = '0.0.5'
  s.summary          = 'Flutter plugin to play video and use iOS AirPlay.'
  s.description      = <<-DESC
    A Flutter plugin to play video from a URL or asset using
    AVPlayerViewController, with native iOS AirPlay support.
  DESC
  s.homepage         = 'https://themonstersapp.com/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'TheMonstersApp' => 'support@themonstersapp.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency       'Flutter'
  s.platform         = :ios, '13.0'
  s.swift_version    = '5.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
