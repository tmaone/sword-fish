function plugin.disable
  if arg.one $argv
    if contains "$argv[1]" $sword_plugins
      rm "$sword_plugin/$argv[1]/.enabled"
    end
  end
end
