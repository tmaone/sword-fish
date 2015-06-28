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
