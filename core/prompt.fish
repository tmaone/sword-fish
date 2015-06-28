function prompt

  if not set -q plugin_init
    prompt.init
  end

  if arg $argv
    if prompt.set "$argv"
      return 0
    else
      return 1
    end
  else
    out.ln (prompt.list)
    return 0
  end

end
