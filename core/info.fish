function info
  if info.enabled
    if arg $argv
      out.ln (color $color_info)" info"(color $color_normal) "$argv"
    end
  end
end
