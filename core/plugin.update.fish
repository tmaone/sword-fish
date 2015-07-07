function plugin.update
  if arg $argv
    for plugin in $argv
      if plugin.exists "$plugin"
        call $git --git-dir="$sword_plugin_root/$plugin/.git" --work-tree="$sword_plugin_root/$plugin" pull
        plugin.load "$plugin"
      end
    end
  else
    for plugin in $sword_plugins
      if dir.exists "$sword_plugin_root/$plugin/.git"
        call $git --git-dir="$sword_plugin_root/$plugin/.git" --work-tree="$sword_plugin_root/$plugin" pull
        plugin.load "$plugin"
      end
    end
  end
end
