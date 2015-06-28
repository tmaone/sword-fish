function plugin.disable
  if arg.one $argv
    if contains "$argv" $sword_plugins
      rm "$sword_plugin/$argv/.enabled"
    end
  end
end
