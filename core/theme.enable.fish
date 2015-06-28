function theme.enable
  if arg.one $argv
    if contains "$argv" $sword_themes
      theme.set "$argv"
    end
  end
end
