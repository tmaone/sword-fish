function random
  if arg.one $argv
    if test $argv[1] -ge 0
      echo (math (builtin random)%$argv)
      return 0
    else
      return 1
    end
  else
    builtin random $argv
    return 0
  end
end
