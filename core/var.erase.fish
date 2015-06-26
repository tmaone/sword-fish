function var.erase
  if arg.one $argv
    if var.query $argv[1]
      set -e $argv[1]
    end
  end
end
