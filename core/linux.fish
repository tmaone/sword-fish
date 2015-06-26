function linux --description 'Evaluates the command if the current Operating System is Linux'
  if test (os) = linux
    if arg $argv
      eval $argv
    end
    return 0
  else
    return 1
  end
end
