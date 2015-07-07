function plugin.enable
  if arg.one $argv
    if plugin.exists "$argv[1]"
      if not file.exists "$sword_plugin_root/$argv[1]/.enabled"
        touch "$sword_plugin_root/$argv[1]/.enabled"
      end
    end
  end
end
