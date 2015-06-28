function plugin.search
  if test -f "$sword_plugin_db"
    cat "$sword_plugin_db"
  end
end
