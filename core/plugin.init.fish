function plugin.init

  if not set -q sword_plugin
    set -xg sword_plugin "$sword_root/plugins"
  end

  if not dir.exists $sword_plugin
    dir.create $sword_plugin
  end

  if dir.exists $sword_plugin
    set -xg sword_plugins (ls $sword_plugin) # find.dirs $argv
  end

  set -xg plugin_init

end
