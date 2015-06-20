import out

function info
  if arg $argv
    out (color $color_info) info (color $color_normal) $argv
  end
end
