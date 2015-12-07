function osx.finder.extensions.on
  osx.defaults.write NSGlobalDomain AppleShowAllExtensions -bool true
end


function osx.finder.extensions.off
  osx.defaults.write NSGlobalDomain AppleShowAllExtensions -bool false
end


function osx.finder.fullpath.on
  osx.defaults.write com.apple.finder _FXShowPosixPathInTitle -bool true
end


function osx.finder.fullpath.off
  osx.defaults.write com.apple.finder _FXShowPosixPathInTitle -bool false
end


function osx.finder.quit.on
  osx.defaults.write com.apple.finder QuitMenuItem -bool true
end


function osx.finder.quit.off
  osx.defaults.write com.apple.finder QuitMenuItem -bool false
end

function osx.finder.statusbar.on
  osx.defaults.write com.apple.finder ShowStatusBar -bool true
end


function osx.finder.statusbar.off
  osx.defaults.write com.apple.finder ShowStatusBar -bool false
end

function osx.finder.show
  osx.defaults.write com.apple.finder AppleShowAllFiles TRUE
end

function osx.finder.hide
  osx.defaults.write com.apple.finder AppleShowAllFiles FALSE
end

function osx.finder.secure-empty.on
  osx.defaults.write com.apple.finder EmptyTrashSecurely -bool true
end

function osx.finder.secure-empty.off
  osx.defaults.write com.apple.finder EmptyTrashSecurely -bool false
end

function osx.finder.warn-empty.on
  osx.defaults.write com.apple.finder WarnOnEmptyTrash -bool true
end

function osx.finder.warn-empty.off
  osx.defaults.write com.apple.finder WarnOnEmptyTrash -bool false
end

function osx.finder.warn-extension.on
  osx.defaults.write com.apple.finder FXEnableExtensionChangeWarning -bool true
end

function osx.finder.warn-extension.off
  osx.defaults.write com.apple.finder FXEnableExtensionChangeWarning -bool false
end


function osx.finder.networkds.off
  osx.defaults.write com.apple.desktopservices DSDontWriteNetworkStores true
end
  
function osx.finder.networkds.on
  osx.defaults.write com.apple.desktopservices DSDontWriteNetworkStores false
end

