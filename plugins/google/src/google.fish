function google

  if arg $argv
    set -l tmp (echo "$argv" | sed s/\ /+/g)
    set -l url https://google.com/search\?q=$tmp
    # debug argument is : $tmp
    # debug url is : $url
    osx open "/Applications/Safari.app" "$url"
    linux call $BROWSER "$url"

  else

  end

end
