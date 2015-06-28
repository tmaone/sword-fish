function plugin.disable.all
  for plugin in $sword_plugins
    if test -f "$sword_plugin/$plugin/.enabled"
      rm "$sword_plugin/$plugin/.enabled"
    end
  end
end
