function var.erase
  if arg.one $argv
    if var.exists $argv[1]
      set -e $argv[1]
    end
  end
end
