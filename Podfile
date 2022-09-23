# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'IssueReport' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for IssueReport
 pod 'SnapKit'
 pod 'IQKeyboardManager'
 pod 'Kommunicate'
 
 post_install do |installer|
   installer.pods_project.targets.each do |target|
     if target.name == 'ApplozicSwift'
       target.build_configurations.each do |config|
         config.build_settings['SWIFT_ACTIVE_COMPILATION_CONDITIONS'] ||= ['$(inherited)']
         config.build_settings['SWIFT_ACTIVE_COMPILATION_CONDITIONS'] << 'SPEECH_REC'
       end
     end
   end
 end

end
