function plugin.init

  if not set -q sword_plugin_root
    set -xg sword_plugin_root "$sword_root/plugins"
  end

  if not dir.exists $sword_plugins_root
    dir.create $sword_plugins_root
  end

  if dir.exists $sword_plugins_root
    set -xg sword_plugins (dir.list $sword_plugins_root) # find.dirs $argv
  end

  set -xg sword_plugin_init

end
