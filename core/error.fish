function error
  if arg $argv
    out.ln (color $color_error)error(color $color_normal) $argv
  end
end
