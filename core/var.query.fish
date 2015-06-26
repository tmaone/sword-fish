function var.query
  if arg.one $argv
    if set -q $argv[1]
      return 0
    else
      return 1
    end
  end
end
