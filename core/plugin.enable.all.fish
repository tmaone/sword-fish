function plugin.enable.all
  for plugin in $sword_plugins
    if not file.exists "$sword_plugin/$plugin/.enabled"
      touch "$sword_plugin/$plugin/.enabled"
    end
  end
end
