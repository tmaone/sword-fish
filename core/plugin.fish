function plugin.init

  if not set -q sword_plugin
    set -xg sword_plugin "$sword_root/plugins"
  end

  if not set -q sword_plugin_remote
    set -xg sword_plugin_remote "$sword_root/plugins/.remote"
  end

  if dir.exists $sword_plugin
  # set -xg sword_plugins (ls -d $sword_plugin/*/)
    set -xg sword_plugins (ls $sword_plugin)
    # echo (ls -d $sword_plugin/*)ls -d */
  end

end

function plugin
  # echo ""
end

function plugin.load
  for plugin in $sword_plugins
  # echo $plugin
    if test -f "$sword_plugin/$plugin/.enabled"
    # echo "$sword_plugin/$plugin/.enabled"
      if test -f "$sword_plugin/$plugin/$plugin.init"
        # echo "$sword_plugin/$plugin/$plugin.init"
        . "$sword_plugin/$plugin/$plugin.init"
      end
      fn.path.add "$sword_plugin/$plugin"
      # echo $plugin
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
  echo $sword_plugins
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
