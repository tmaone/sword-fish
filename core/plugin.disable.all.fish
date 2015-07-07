function plugin.disable.all
  for plugin in $sword_plugins
    if test -f "$sword_plugin_root/$plugin/.enabled"
      rm "$sword_plugin_root/$plugin/.enabled"
    end
  end
end
