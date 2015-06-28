
function plugin.disable
  if arg.one $argv
    if contains "$argv" $sword_plugins
      /bin/rm "$sword_plugin/$argv/.enabled"
    end
  end
end
