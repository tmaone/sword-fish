function file.exists
  if test -f $argv
    return 0
  else
    return 1
  end
end
