function arg.first
  if test (arg.count $argv) -ge 1
    echo $argv[1]
    return 0
  else
    return 1
  end
end
