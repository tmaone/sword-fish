function plugin.unload

if arg $argv

  for plugin in $argv
    if file.exists "$sword_plugin_root/$plugin/.enabled"
      fn.path.remove "$sword_plugin_root/$plugin/src"
    end
  end

else

  for plugin in $sword_plugins
    if file.exists "$sword_plugin_root/$plugin/.enabled"
      fn.path.remove "$sword_plugin_root/$plugin/src"
    end
  end
end

end
