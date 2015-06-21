function osx.init

  find.program defaults
  find.program rm
  find.program killall
  find.program chflags
  find.program ioreg
  find.program tmutil

  if not set -q osx
    var.global osx "$sword_plugin/osx/src/osx.fish"
  end

  if file.exists $osx
    source $osx
  end

end

osx osx.init

linux error "not supported"
