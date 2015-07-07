function plugin.init

  if not set -q sword_plugin_root
    set -xg sword_plugin_root "$sword_root/plugins"
  end

  if not dir.exists $sword_plugin_root
    dir.create $sword_plugin_root
  end

  if dir.exists $sword_plugin_root
    set -xg sword_plugins (dir.list $sword_plugin_root)
  end

  function sword.plugin.update --on-event sword_update
    plugin.update
  end

  set -xg sword_plugin_init

end
