function arg.count
  if arg $argv
    count $argv
    return 0
  else
    count
    return 1
  end
end
