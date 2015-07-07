function plugin.enable.all
  for plugin in $sword_plugins
    if not file.exists "$sword_plugin_root/$plugin/.enabled"
      touch "$sword_plugin_root/$plugin/.enabled"
    end
  end
end
