function osx.diskutil.develop
  call $defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
end

function osx.diskutil.disk-verification.on
  call $defaults write com.apple.frameworks.diskimages skip-verify -bool false
  call $defaults write com.apple.frameworks.diskimages skip-verify-locked -bool false
  call $defaults write com.apple.frameworks.diskimages skip-verify-remote -bool false
end

function osx.diskutil.disk-verification.off
  call $defaults write com.apple.frameworks.diskimages skip-verify -bool true
  call $defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
  call $defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
end
