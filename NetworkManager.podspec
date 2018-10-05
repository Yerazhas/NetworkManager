Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "NetworkManager"
s.summary = "NetworkManager is a lighweight network manager wrapped around Alamofire and SwiftyJSON."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Yera Zhas" => "yeraszhas@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/Yerazhas/NetworkManager"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/Yerazhas/NetworkManager.git", 
             :tag => "#{s.version}" }

# 7
s.framework = "UIKit"
s.dependency 'Alamofire', '~> 4.7'
s.dependency 'SwiftyJSON'

# 8
s.source_files = "NetworkManager/**/*.{swift}"

# 9

# 10
s.swift_version = "4.2"

end