function plugin.exists
  if arg.one $argv
    if contains "$argv[1]" $sword_plugins
      return 0
    else
      return 1
    end
  else
    return 1
  end
end
