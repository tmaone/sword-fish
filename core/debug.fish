function debug
  if debug.enabled
    if arg $argv
      switch $argv[1]
        case eval
          eval $argv
        case '*'
          printf "%s%s%s%s\n" (color $color_debug) "debug " (color $color_normal) "$argv"
      end
    end
  end
end
