function git.is
  if arg.one $argv
    if test -d $argv[1]/.git
      return 0
    else
      return 1
    end
  end
end
