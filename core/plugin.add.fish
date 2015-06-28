function plugin.add
  if arg $argv
    call $git clone $argv[2] $sword_plugin/$argv[1]
  end
end
