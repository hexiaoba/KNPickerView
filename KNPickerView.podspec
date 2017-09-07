Pod::Spec.new do |s|  
s.name             = "KNPickerView"  
s.version          = "1.0.2"  
s.summary          = "picker"
s.description  = <<-DESC
                    A picker view used on iOS.
                   DESC
s.homepage         = "https://github.com/hexiaoba/KNPickerView"  
s.license         = { :type => "MIT", :file => "LICENSE" } 
s.author           = { "hexiaoba" => "hkn35135@163.com" }  
s.source           = { :git => "https://github.com/hexiaoba/KNPickerView.git", :tag => s.version.to_s }  


s.ios.deployment_target = '8.0'   

s.source_files = 'KNPickerView/*.{h,m}'  
# s.resources = 'Assets'  

end
