function osx.init

  find.program defaults
  find.program rm
  find.program killall
  find.program chflags
  find.program ioreg
  find.program tmutil
  find.program diskutil
  find.program purge
  find.program periodic
  find.program softwareupdate
  find.program osascript
  find.program tail
  find.program dscacheutil
  find.program launchctl
  find.program scutil
  find.program dscl
  find.program grep
  find.program dseditgroup
  find.program sort
  find.program awk

  var.global PlistBuddy "/usr/libexec/PlistBuddy"

  if not set -q osx
    var.global osx (ls $sword_plugin/osx/src/*.fish)
  end

  for file in $osx
     builtin source $file
  end

end

osx osx.init

linux error "not supported"
