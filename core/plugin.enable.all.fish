function plugin.enable.all
  for plugin in $sword_plugins
    touch "$sword_plugin/$plugin/.enabled"
  end
end
