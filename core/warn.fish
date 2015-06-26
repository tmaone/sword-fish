function warn
  if warn.enabled
    if arg $argv
      printf "%s%s%s%s\n" (color $color_warn) " warn " (color $color_normal) "$argv"
    end
  end
end
