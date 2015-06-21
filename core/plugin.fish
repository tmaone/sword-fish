function plugin.init

  if not set -q sword_plugin
    set -xg sword_plugin "$sword_root/plugins"
  end

  if not dir.exists $sword_plugin
    dir.create $sword_plugin
  # set -xg sword_plugins (ls -d $sword_plugin/*/)
    # set -xg sword_plugins (ls $sword_plugin)
    # echo (ls -d $sword_plugin/*)ls -d */
  end

  if dir.exists $sword_plugin
    set -xg sword_plugins (ls $sword_plugin)
  end

  plugin.load

  set -xg plugin_init

end

function plugin

  if not set -q plugin_init
    plugin.init
  end

  if arg $argv
    if contains "$argv" $sword_plugins
      return 0
    else
      return 1
    end
  else
    out $sword_plugins
    return 0
  end
  # echo ""
end

function plugin.load
  if arg $argv
    for plugin in $argv
      if file.exists "$sword_plugin/$plugin/.enabled"
        if file.exists "$sword_plugin/$plugin/init.fish"
          source "$sword_plugin/$plugin/init.fish"
        end
        if dir.exists "$sword_plugin/$plugin/src"
          fn.path.add "$sword_plugin/$plugin/src"
        end
      end
    end
  else
    for plugin in $sword_plugins
      if file.exists "$sword_plugin/$plugin/.enabled"
        if file.exists "$sword_plugin/$plugin/init.fish"
          source "$sword_plugin/$plugin/init.fish"
        end
        if dir.exists "$sword_plugin/$plugin/src"
          fn.path.add "$sword_plugin/$plugin/src"
        end
      end
    end
  end

end

function plugin.unload
  for plugin in $sword_plugins
    if test -f "$sword_plugin/$plugin/.enabled"
      fn.path.remove "$sword_plugin/$plugin"
    end
  end
end

function plugin.list
  out $sword_plugins
end

function plugin.enable
  if arg.one $argv
    if contains "$argv" $sword_plugins
      touch "$sword_plugin/$argv/.enabled"
    end
  end
end

function plugin.enable.all
  for plugin in $sword_plugins
    touch "$sword_plugin/$plugin/.enabled"
  end
end

function plugin.disable
  if arg.one $argv
    if contains "$argv" $sword_plugins
      /bin/rm "$sword_plugin/$argv/.enabled"
    end
  end
end

function plugin.disable.all
  for plugin in $sword_plugins
    if test -f "$sword_plugin/$plugin/.enabled"
      /bin/rm "$sword_plugin/$plugin/.enabled"
    end
  end
end

function plugin.enabled
  if arg.one $argv
    if contains "$argv" $sword_plugins
      if test -f "$sword_plugin/$argv/.enabled"
        return 0
      else
        return 1
      end
    end
  else
    for plugin in $sword_plugins
      if test -f "$sword_plugin/$plugin/.enabled"
        echo -n "$plugin "
      end
    end
  end
end

function plugin.disabled
if arg.one $argv
  if contains "$argv" $sword_plugins
    if not test -f "$sword_plugin/$argv/.enabled"
      return 0
    else
      return 1
    end
  end
  else
  for plugin in $sword_plugins
    if not test -f "$sword_plugin/$plugin/.enabled"
      echo -n "$plugin "
    end
  end
end
end

function plugin.search
  if test -f "$sword_plugin_remote"
    cat "$sword_plugin_remote"
  end
end

# if [ -f "$sword_root/plugins/$plugin/$plugin" ]
#     # alias $plugin="$fish_config_path/plugins/$plugin/$plugin"
#     # set -g "$plugin"_path "$sword_root/plugins/$plugin"
#     # . "$sword_root/plugins/$plugin/$plugin"
# end

# if [ -d "$sword_root/plugins" ]
# else
#     log.error "Plugins folder does not exist"
# end


    # echo (ls $sword_plugin)
    # end
  # echo 3

#     for plugin in (ls $sword_root/plugins)
#         if [ -f "$sword_root/plugins/$plugin/$plugin" ]
#             # alias $plugin="$fish_config_path/plugins/$plugin/$plugin"
#             # set -g "$plugin"_path "$sword_root/plugins/$plugin"
#             # . "$sword_root/plugins/$plugin/$plugin"
#         end
#     end
# # else
    # log.error "Plugins folder does not exist"
# end
  # plugin.load
