function warn
  if arg $argv
    out.ln (color $color_warn)warn(color $color_normal) $argv
  end
end
