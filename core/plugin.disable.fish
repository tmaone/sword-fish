function plugin.disable
  if arg.one $argv
    if plugin.exists "$argv[1]"
      if file.exists "$sword_plugin_root/$argv[1]/.enabled"
        rm "$sword_plugin_root/$argv[1]/.enabled"
      end
    end
  end
end
