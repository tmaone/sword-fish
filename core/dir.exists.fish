function dir.exists
  if test -d $argv
    return 0
  else
    return 1
  end
end
