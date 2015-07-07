function syno.init

  if not set -q syno
    var.global syno (ls $sword_plugin_root/syno/src/*.fish)
  end

  for file in $syno
     builtin source $file
  end

end

function syno.not_supported

end

syno syno.init
osx syno.not_supported
linux syno.not_supported
