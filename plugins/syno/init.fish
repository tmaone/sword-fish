function syno.init

  if not set -q syno
    var.global syno (ls $sword_plugin/syno/src/*.fish)
  end

  for file in $syno
     builtin source $file
  end

end

syno syno.init
#osx error "not supported"
#linux error "not supported"
