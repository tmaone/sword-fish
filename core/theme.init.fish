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
