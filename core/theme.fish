function theme.init

  if not set -q sword_theme
    set -xg sword_theme "$sword_root/themes"
  end

  if not dir.exists $sword_theme
    dir.create $sword_theme
  end

  if dir.exists $sword_theme
    set -xg sword_themes (ls $sword_theme)
  end

  theme.load

  if not theme.set
    theme.set $sword_themes[1]
  end

  set -xg theme_init

end

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

function theme.load
  for theme in $sword_themes
    if file.exists "$sword_theme/$theme/$theme.theme"
      source "$sword_theme/$theme/$theme.theme"
      # debug "$sword_theme/$theme/$theme.theme"
    end
  end
end

function theme.list
  out $sword_themes
end

function theme.enable
  if arg.one $argv
    if contains "$argv" $sword_themes
      theme.set "$argv"
    end
  end
end

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
