function subl
  if not test -z "$subl"
    if arg $argv
      call \'$subl\' $argv
      return 0
    else
      call \'$subl\'
      return 0
    end
  else
    return 1
  end
end
