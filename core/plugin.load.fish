function plugin.load
  if arg $argv
    for plugin in $argv
      if file.exists "$sword_plugin_root/$plugin/.enabled"
        if file.exists "$sword_plugin_root/$plugin/init.fish"
          builtin source "$sword_plugin_root/$plugin/init.fish"
        end
        if dir.exists "$sword_plugin_root/$plugin/src"
          fn.path.add "$sword_plugin_root/$plugin/src"
        end
      end
    end
  else
    for plugin in $sword_plugins
      if file.exists "$sword_plugin_root/$plugin/.enabled"
        if file.exists "$sword_plugin_root/$plugin/init.fish"
          builtin source "$sword_plugin_root/$plugin/init.fish"
        end
        if dir.exists "$sword_plugin_root/$plugin/src"
          fn.path.add "$sword_plugin_root/$plugin/src"
        end
      end
    end
  end
end
