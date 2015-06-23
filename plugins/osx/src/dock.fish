function osx.dock.launch-animation.on
  osx.defaults.write com.apple.dock launchanim -bool true
end

function osx.dock.launch-animation.off
  osx.defaults.write com.apple.dock launchanim -bool false
end

function osx.dock.light.on
  osx.defaults.write com.apple.dock show-process-indicators -bool true
end

function osx.dock.light.off
  osx.defaults.write com.apple.dock show-process-indicators -bool false
end
