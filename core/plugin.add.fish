function plugin.add
  if arg.one $argv
    if not dir.exists $sword_plugin/$argv[1]
      call $git clone $argv[2] $sword_plugin/$argv[1]
    else
      plugin.update "$argv[1]"
    end
  else
    error invalid
  end
end
