function theme.load
  for theme in $sword_themes
    if file.exists "$sword_theme/$theme/$theme.theme"
      builtin source "$sword_theme/$theme/$theme.theme"
      # debug "$sword_theme/$theme/$theme.theme"
    end
  end
end
