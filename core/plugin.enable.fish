function plugin.enable
  if arg.one $argv
    if contains "$argv[1]" $sword_plugins
      if not file.exists "$sword_plugin/$argv[1]/.enabled"
        touch "$sword_plugin/$argv[1]/.enabled"
      end
    end
  end
end
