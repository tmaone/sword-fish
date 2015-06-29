function exists
  if arg $argv
    if test -e "$argv[1]"
      return 0
    else
      return 1
    end
  end
end
