
function osx.safari.develop
  call $defaults write com.apple.Safari IncludeDevelopMenu -bool true
  call $defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  call $defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
end

function osx.safari.webgl.on
  osx.defaults.write com.apple.Safari WebKitWebGLEnabled -bool YES
end

function osx.safari.webgl.off
  osx.defaults.write com.apple.Safari WebKitWebGLEnabled -bool NO
end

function osx.safari.clean-previews
  call $rm -rfv $HOME/Library/Caches/com.apple.Safari/Webpage\ Previews/*
end
