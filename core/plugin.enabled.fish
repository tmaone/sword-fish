function plugin.enabled
  if arg.one $argv
    if plugin.exists "$argv[1]"
      if test -f "$sword_plugin_root/$argv[1]/.enabled"
        return 0
      else
        return 1
      end
    end
  else
    for plugin in $sword_plugins
      if test -f "$sword_plugin_root/$plugin/.enabled"
        out.ln "$plugin"
      end
    end
  end
end
