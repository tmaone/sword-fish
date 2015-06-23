function osx.defaults
  call $defaults $argv
end

function osx.defaults.read
  call $defaults read $argv
end

function osx.defaults.write
  call $defaults write $argv
end

function osx.defaults.write.currenthost
  call $defaults -currentHost write $argv
end
