function theme.set
  if arg.one $argv
    if contains $argv[1] $sword_themes
      var.global theme "$argv[1].theme"
      function fish_theme
        eval $theme
      end
    end
  else
    if set -q theme
      return 0
    else
      return 1
    end
  end
end
