function theme

  if not set -q theme_init
    theme.init
  end

  if arg $argv
    if contains "$argv" $sword_themes
      return 0
    else
      return 1
    end
  else
    out $sword_themes
    return 0
  end

end
