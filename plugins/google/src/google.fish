function google

  function google.osx
    # debug $argv
    info "Googling [$argv]"
    call $open -a "Safari\n$argv"
  end

  function google.linux
  info "Googling [$argv]"
    call $BROWSER "$argv"
  end

  if arg $argv

    set -l tmp (echo "$argv" | sed s/\ /+/g)
    set -l url https://google.com/search\?q=$tmp
    # debug argument is : $tmp
    # debug url is : $url
    # osx $open "/Applications/Safari.app\n$url"
    # debug "[$tmp]\n[$url]"

    if osx
     google.osx $url
    end
    if linux
     google.linux $url
    end

  else

  end

end
