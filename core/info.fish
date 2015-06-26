function info
  if info.enabled
    if arg $argv
      printf "%s%s%s%s\n" (color $color_info) " info " (color $color_normal) "$argv"
    end
  end
end
