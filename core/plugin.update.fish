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
      if git.is "$sword_plugin_root/$plugin"
        if plugin.update.check "$plugin"
          info "Updating plugin [$plugin] ..."
          call $git --git-dir="$sword_plugin_root/$plugin/.git" --work-tree="$sword_plugin_root/$plugin" pull --quiet
          plugin.load "$plugin"
        else
          debug "plugin [$plugin] is up-to-date ..."
        end
      end
    end
  end
end
