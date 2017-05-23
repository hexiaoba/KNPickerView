Pod::Spec.new do |s|  
s.name             = "KNPickerView"  
s.version          = "1.0.1"  
s.summary          = "A picker view used on iOS."  
s.homepage         = "https://github.com/hexiaoba/KNPickerView"  
#s.description  = <<-DESC 
#                       a picker view used on iOS   
#                   DESC
# s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"  
s.license         = { :type => "MIT", :file => "LICENSE" } 
s.author           = { "hexiaoba" => "hkn35135@163.com" }  
s.source           = { :git => "https://github.com/hexiaoba/KNPickerView.git", :tag => s.version.to_s }  
# s.social_media_url = 'https://www.sina.cn/NAME'  

s.platform     = :ios, '8.0'  
# s.ios.deployment_target = '8.0'  
s.requires_arc = true  

s.source_files = 'KNPickerView/*.{h,m}'  
# s.resources = 'Assets'  

end
