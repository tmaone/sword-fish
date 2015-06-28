
function plugin.unload
  for plugin in $sword_plugins
    if test -f "$sword_plugin/$plugin/.enabled"
      fn.path.remove "$sword_plugin/$plugin"
    end
  end
end
