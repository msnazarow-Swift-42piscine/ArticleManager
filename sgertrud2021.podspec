Pod::Spec.new do |s|
  s.name             = 'sgertrud2021'
  s.version          = '0.1.4'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'msnazarow' => 'msnazarow@gmail.com' }
  s.summary          = 'ArticleManager for keep your notes in percistense'
  s.description      = <<-DESC
  This is my first cocoapod maked for School21, bound up with PersonalDiary project
  I insert some NSPersistentContainer extention to solve bundle issue and also StringInterpolation extention to print Date
  So the main goal of the pod is to make your articles persistes and incapusale work with Coredata
                       DESC
  s.homepage         = 'https://github.com/msnazarow/sgertrud2021'
  s.module_name   = 'ArticleManager'
  s.source           = { :git => 'https://github.com/msnazarow/sgertrud2021.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  s.ios.deployment_target = '12.0'
  s.ios.source_files = ['sgertrud2021/Classes/**/*.swift', 'sgertrud2021/Extentions/**/*.swift']
  s.resources = "sgertrud2021/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,xcdatamodeld}"
  s.resource_bundles = { 'sgertrud2021' => ['sgertrud2021/Assets/*.xcdatamodeld']}
  s.frameworks = 'UIKit', 'CoreData'
end
