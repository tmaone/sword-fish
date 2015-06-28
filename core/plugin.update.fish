function plugin.update
  if arg.one $argv
    if plugin.exists "$argv[1]"
        call $git --git-dir="$sword_plugin/$argv[1]/.git" --work-tree="$sword_plugin/$argv[1]" pull
        plugin.load "$argv[1]"
    end
  end
end
