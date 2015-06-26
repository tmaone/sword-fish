function fn.exists
  if functions -q $argv
    return 0
  else
    return 1
  end
end
