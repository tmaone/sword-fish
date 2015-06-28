function plugin.enable
  if arg.one $argv
    if contains "$argv" $sword_plugins
      touch "$sword_plugin/$argv/.enabled"
    end
  end
end
